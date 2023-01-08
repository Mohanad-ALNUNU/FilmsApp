class ContentManager {

Map<String, String> _dummyCategoryMap = {
  "learning": "Dummy1",
  "teaching": "Dummy2",
  "working": "Dummy3",
  "playing": "Dummy4"
};
Map<String, Map> _dummyContentMap = {
  "content1": {
    "image": "https://picsum.photos/300/301/?blur",
    "duree": "1h30s",
    "date": "10/12/2015",
    "title": "Title Of Content 11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111sssssssssssssssss"
  },
  "content2": {
    "image": "https://picsum.photos/302/300/?blur=2",
    "duree": "30s",
    "date": "06/07/2005",
    "title": "Really Title Of Content 2"
  },
  "content3": {
    "image": "https://picsum.photos/300/300/?blur=3",
    "duree": "4h56s",
    "date": "10/12/2022",
    "title": "The time"
  },
  "content4": {
    "image": "https://picsum.photos/300/302/?blur",
    "duree": "1h30s",
    "date": "10/12/2015",
    "title": "The united evolution in the whole world and in arab worlds"
  },
  "content5": {
    "image": "https://picsum.photos/300/305/?blur=2",
    "duree": "30s",
    "date": "06/07/2005",
    "title": "Title Of Content 2"
  },
  "content6": {
    "image": "https://picsum.photos/305/300/?blur=3",
    "duree": "4h56s",
    "date": "10/12/2022",
    "title": "Title Of Content 3"
  },
  "content7": {
    "image": "https://picsum.photos/300/306/?blur",
    "duree": "1h30s",
    "date": "10/12/2015",
    "title": "Title Of Content 1"
  },
  "content8": {
    "image": "https://picsum.photos/307/300/?blur=2",
    "duree": "30s",
    "date": "06/07/2005",
    "title": "Title Of Content 2"
  },
  "content9": {
    "image": "https://picsum.photos/300/308/?blur=3",
    "duree": "4h56s",
    "date": "10/12/2022",
    "title": "Title Of Content 3"
  },
};

Map<String, Map> getContentMap(){
return _dummyContentMap;
}
Map<String, String> getCategoriesMap(){
return _dummyCategoryMap;
}
Map<String, Map> searchByNameInContentMap(String keyword){
Map<String, Map> searchResults={};
_dummyContentMap.forEach((key, value) {
  // if(value['title'].split(" ")[0].contains(keyword) && keyword.length>3){
  //   searchResults[key]=value;
  // }
  var tempVal = value['title'].toString().toLowerCase();
  if(tempVal.contains(keyword.toLowerCase()) && keyword.length>3){
    searchResults[key]=value;
  }
});
return searchResults;
}



}