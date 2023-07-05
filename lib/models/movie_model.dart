class MovieListModel {
  late final String id, titleKor, titleEng, prdYear, prdState;
  late final List<String> nations, genres, directors, companies;

  MovieListModel.fromJson(Map<String, dynamic> json) {
    id = json["movieCd"];
    titleKor = json["movieNm"];
    titleEng = json["movieNmEn"];
    prdYear = json["prdtYear"];
    prdState = json["prdtStatNm"];
    nations = json["nationAlt"].split(",");
    genres = json["genreAlt"].split(",");
    List directorList = json["directors"];
    directors = [];
    for (var director in directorList) {
      directors.add(director["peopleNm"]);
    }
    List companyList = json["companys"];
    companies = [];
    for (var company in companyList) {
      companies.add(company["companyNm"]);
    }
  }
}
