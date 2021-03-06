import requests
import pandas as pd
import csv

# Create a dictionary for all views with their respective object
paintingInfo = {}


def viewsCounter(url):
    r = requests.get(url)
    count = 0

    # Convert data to JSON format
    data = r.json()

    # Extract the info and records
    info = data['info']
    records = data['records']




    for record in records:

        # Convert object ID to a string so it's accessible as a dictionary key
        objectid = str(record['objectid'])

        # If the object already has a recorded move, increment by one
        if objectid in paintingInfo:
            continue        # Otherwise, record the object's first move
        else:
            object_url = 'https://api.harvardartmuseums.org/object/' + objectid + '?apikey=0da38a14-bbb6-4aa3-be66-23a84b502e41'
            object_info = requests.get(object_url)

            # Convert to JSON format
            object_data = object_info.json()


            # Get title and artist of object
            try:
                object_title = object_data["title"]
            except:
                object_title = "unknown"



            try:
                object_artist = object_data["people"][0]["name"]
            except:
                object_artist = "unknown"

            try:
                object_culture = object_data["culture"]
            except:
                object_culture = "unknown"

            try:
                object_primaryimageurl = object_data["primaryimageurl"]
            except:
                object_primaryimageurl= "unknown"

            try:
                object_color1 = object_data["colors"][0]["color"]
            except:
                object_color1 = "unknown"

            try:
                object_color2 = object_data["colors"][1]["color"]
            except:
                object_color2 = "unknown"

            try:
                object_color3 = object_data["colors"][2]["color"]
            except:
                object_color3 = "unknown"

            try:
                object_hue1 = object_data["colors"][0]["hue"]
            except:
                object_hue1 = "unknown"

            try:
                object_hue2 = object_data["colors"][1]["hue"]
            except:
                object_hue2 = "unknown"

            try:
                object_hue3 = object_data["colors"][2]["hue"]
            except:
                object_hue3 = "unknown"

            try:
                object_percent1 = object_data["colors"][0]["percent"]
            except:
                object_percent1 = "unknown"

            try:
                object_percent2 = object_data["colors"][1]["percent"]
            except:
                object_percent2 = "unknown"

            try:
                object_percent3 = object_data["colors"][2]["percent"]
            except:
                object_percent3 = "unknown"

            try:
                object_year = object_data["dateend"]
            except:
                object_year = "unknown"





            paintingInfo[objectid] = [{'id': objectid, 'title': object_title, 'artist': object_artist, 'culture': object_culture, 'image' : object_primaryimageurl, 'hex1': object_color1 , 'hex2' :object_color2 , 'hex3' : object_color3 , 'percent1' : object_percent1, 'percent2' : object_percent2, 'percent3': object_percent3, 'hue1' : object_hue1, 'hue2' : object_hue2, 'hue3' : object_hue3, 'year' : object_year}]
            count = count +1



    # Error handling if it reaches >10,000 records

    print(count)
    try:
        if (info['next']):
            viewsCounter(info['next'])

    except:
        pass



# Find all recorded views
url = 'https://api.harvardartmuseums.org/activity?type=studycenterviews&q=date:>2020&apikey=0da38a14-bbb6-4aa3-be66-23a84b502e41&size=100'
viewsCounter(url)

print(len(paintingInfo))





#c= csv.writer(open("mytems.csv", "w"), lineterminator='\n')


csv_file = "data.csv"
csv_columns = ['id', 'title', 'artist', 'culture', 'image', 'hex1','hex2', 'hex3', 'percent1', 'percent2', 'percent3', 'hue1', 'hue2', 'hue3', 'year']
try:
    with open(csv_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for data in paintingInfo:
            value = paintingInfo.get(data)
            try:
                writer.writerows(value)
            except:
                continue


except IOError:
    print("I/O error")

