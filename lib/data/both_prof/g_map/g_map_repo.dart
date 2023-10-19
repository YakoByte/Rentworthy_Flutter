import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/g_map/g_map.dart';

abstract class GMapRepository {
  Future<GMapResponse?> getmapData();
}

class GMapRepositoryV1 extends GMapRepository {
  final List<Office> _onOfficeList = [
    const Office(
        address: "Aabogade 15\n8200 Aarhus\nDenmark",
        id: "aarhus",
        image:
            "https://lh3.googleusercontent.com/tpBMFN5os8K-qXIHiAX5SZEmN5fCzIGrj9FdJtbZPUkC91ookSoY520NYn7fK5yqmh1L1m3F2SJA58v6Qps3JusdrxoFSwk6Ajv2K88",
        lat: 56.172249,
        lng: 10.187372,
        name: "Aarhus",
        phone: "",
        region: "europe"),
    const Office(
        address: "Claude Debussylaan 34\n1082 MD, Amsterdam\nNetherlands",
        id: "amsterdam",
        image:
            "https://lh3.googleusercontent.com/gG1zKXcSmRyYWHwUn2Z0MITpdqwb52RAEp3uthG2J5Xl-4_Wz7_WmoM6T_TBg6Ut3L1eF-8XENO10sxVIFdQHilj8iRG29wROpSoug",
        lat: 52.337801,
        lng: 4.872066,
        name: "Amsterdam",
        phone: "",
        region: "europe"),
    const Office(
        address: "2300 Traverwood Dr.\nAnn Arbor, MI 48105\nUnited States",
        id: "ann-arbor",
        image:
            "https://lh3.googleusercontent.com/Iim0OVcAgg9vmXc5ADn9KvOQFplrMZ8hBTg2biiTtuWPy_r56cy4Byx1ROk6coGt7knQdmx_jO45VX1kiCJZ0QzEtS97AP_BYG4F2w",
        lat: 42.3063848,
        lng: -83.7140833,
        name: "Ann Arbor",
        phone: "+1 734-332-6500",
        region: "north-america"),
    const Office(
        address: "Fragkokklisias 7\nAthens 151 25\nGreece",
        id: "athens",
        image:
            "https://lh3.googleusercontent.com/XroZnqewSrO6KuvXM5hDHtjUJzUcRQLZYfCKs4jP44dKezRvNx58uxaqUKS4fQ2eXzG2TpJNJ1X2xtfBe7Prl5hSG_xjPEF1xLtFodM",
        lat: 38.03902,
        lng: 23.804595,
        name: "Athens",
        phone: "",
        region: "europe"),
  ];

  List<Office>? get onOfficeList => _onOfficeList;
  final List<Region> _onRegionlist = [
    const Region(
        lat: -17.5554497,
        lng: -99.2316195,
        id: "latin-america",
        name: "Latin America",
        zoom: 3),
    const Region(
        lat: 0.0524811,
        lng: 127.6560787,
        id: "asia-pacific",
        name: "Asia Pacific",
        zoom: 3),
    const Region(
        lat: 46.1352815, lng: 7.4033438, id: "europe", name: "Europe", zoom: 4),
    const Region(
        lat: 45.7128252,
        lng: -97.1547448,
        id: "north-america",
        name: "North America",
        zoom: 4),
  ];

  List<Region>? get onRegionlist => _onRegionlist;

  @override
  Future<GMapResponse?> getmapData() async {
    return GMapResponse(
      offices: _onOfficeList,
      regions: _onRegionlist,
    );
  }
}

final gMapRepositoryProvider =
    Provider<GMapRepository>((ref) => GMapRepositoryV1());
