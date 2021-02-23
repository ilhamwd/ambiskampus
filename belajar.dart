class Proposal {
  String name;
  int age;
  String alamat;
  Portfolio portfolio;

  Proposal({this.name, this.alamat, this.age});

  Proposal addPortfolio(String link) {
    portfolio = new Portfolio(link: link);
    return this;
  }

  makeView() {
    print(
        "====== MY PROPOSAL ======\nName\t\t: $name\nAge\t\t: $age\nAddress\t\t: $alamat\nPortfolio\t: ${portfolio.link}");
  }
}

class Portfolio {
  String link;

  Portfolio({this.link});
}

main(List<String> args) {
  Proposal myProposal = Proposal(
    name: "Muhammad Arifin Ilham",
    age: 17,
    alamat: "Sapugarut Gg. Pismatex 40 RT 14/05",
  );
  myProposal.addPortfolio("https://apps.ambiskampus.com");
  myProposal.makeView();

  Map<String, int> ngent = {"ghina": 31};
  print(ngent["ghina"]);
}
