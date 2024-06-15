class MoaData {
  bool? isValid;
  List<Data>? data;

  MoaData({this.isValid, this.data});

  MoaData.fromJson(Map<String, dynamic> json) {
    isValid = json['is_valid'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_valid'] = this.isValid;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nomorMou;
  String? nomorMoa;
  String? judulMoa;
  String? tanggalDibuat;
  String? tanggalBerakhir;
  String? fileMoa;
  String? filePath;
  int? levelMoa;
  int? jenisDoc;
  KategoriMoa? kategoriMoa;
  String? status;
  int? relevansiProdi;
  String? kerjaSamaDengan;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  DocMou? docMou;
  LevelDocMoa? levelDocMoa;
  JenisMoa? jenisMoa;
  RelevansiProdiMoa? relevansiProdiMoa;

  Data(
      {this.id,
      this.nomorMou,
      this.nomorMoa,
      this.judulMoa,
      this.tanggalDibuat,
      this.tanggalBerakhir,
      this.fileMoa,
      this.filePath,
      this.levelMoa,
      this.jenisDoc,
      this.kategoriMoa,
      this.status,
      this.relevansiProdi,
      this.kerjaSamaDengan,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.docMou,
      this.levelDocMoa,
      this.jenisMoa,
      this.relevansiProdiMoa});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomorMou = json['nomor_mou'];
    nomorMoa = json['nomor_moa'];
    judulMoa = json['judul_moa'];
    tanggalDibuat = json['tanggal_dibuat'];
    tanggalBerakhir = json['tanggal_berakhir'];
    fileMoa = json['file_moa'];
    filePath = json['file_path'];
    levelMoa = json['level_moa'];
    jenisDoc = json['jenis_doc'];
    kategoriMoa = json['kategori_moa'] != null
        ? new KategoriMoa.fromJson(json['kategori_moa'])
        : null;
    status = json['status'];
    relevansiProdi = json['relevansi_prodi'];
    kerjaSamaDengan = json['kerja_sama_dengan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    docMou =
        json['doc_mou'] != null ? new DocMou.fromJson(json['doc_mou']) : null;
    levelDocMoa = json['level_doc_moa'] != null
        ? new LevelDocMoa.fromJson(json['level_doc_moa'])
        : null;
    jenisMoa = json['jenis_moa'] != null
        ? new JenisMoa.fromJson(json['jenis_moa'])
        : null;
    relevansiProdiMoa = json['relevansi_prodi_moa'] != null
        ? new RelevansiProdiMoa.fromJson(json['relevansi_prodi_moa'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomor_mou'] = this.nomorMou;
    data['nomor_moa'] = this.nomorMoa;
    data['judul_moa'] = this.judulMoa;
    data['tanggal_dibuat'] = this.tanggalDibuat;
    data['tanggal_berakhir'] = this.tanggalBerakhir;
    data['file_moa'] = this.fileMoa;
    data['file_path'] = this.filePath;
    data['level_moa'] = this.levelMoa;
    data['jenis_doc'] = this.jenisDoc;
    if (this.kategoriMoa != null) {
      data['kategori_moa'] = this.kategoriMoa!.toJson();
    }
    data['status'] = this.status;
    data['relevansi_prodi'] = this.relevansiProdi;
    data['kerja_sama_dengan'] = this.kerjaSamaDengan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.docMou != null) {
      data['doc_mou'] = this.docMou!.toJson();
    }
    if (this.levelDocMoa != null) {
      data['level_doc_moa'] = this.levelDocMoa!.toJson();
    }
    if (this.jenisMoa != null) {
      data['jenis_moa'] = this.jenisMoa!.toJson();
    }
    if (this.relevansiProdiMoa != null) {
      data['relevansi_prodi_moa'] = this.relevansiProdiMoa!.toJson();
    }
    return data;
  }
}

class KategoriMoa {
  int? id;
  String? namaKategori;
  String? keterangan;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  KategoriMoa(
      {this.id,
      this.namaKategori,
      this.keterangan,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  KategoriMoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKategori = json['nama_kategori'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kategori'] = this.namaKategori;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class DocMou {
  int? id;
  String? nomorMou;
  String? judulMou;
  int? jenisDoc;
  String? tanggalDibuat;
  String? tanggalBerakhir;
  String? fileMou;
  String? filePath;
  int? levelMou;
  int? kategoriMou;
  int? relevansiProdi;
  String? status;
  String? kerjaSamaDengan;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  DocMou(
      {this.id,
      this.nomorMou,
      this.judulMou,
      this.jenisDoc,
      this.tanggalDibuat,
      this.tanggalBerakhir,
      this.fileMou,
      this.filePath,
      this.levelMou,
      this.kategoriMou,
      this.relevansiProdi,
      this.status,
      this.kerjaSamaDengan,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DocMou.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomorMou = json['nomor_mou'];
    judulMou = json['judul_mou'];
    jenisDoc = json['jenis_doc'];
    tanggalDibuat = json['tanggal_dibuat'];
    tanggalBerakhir = json['tanggal_berakhir'];
    fileMou = json['file_mou'];
    filePath = json['file_path'];
    levelMou = json['level_mou'];
    kategoriMou = json['kategori_mou'];
    relevansiProdi = json['relevansi_prodi'];
    status = json['status'];
    kerjaSamaDengan = json['kerja_sama_dengan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomor_mou'] = this.nomorMou;
    data['judul_mou'] = this.judulMou;
    data['jenis_doc'] = this.jenisDoc;
    data['tanggal_dibuat'] = this.tanggalDibuat;
    data['tanggal_berakhir'] = this.tanggalBerakhir;
    data['file_mou'] = this.fileMou;
    data['file_path'] = this.filePath;
    data['level_mou'] = this.levelMou;
    data['kategori_mou'] = this.kategoriMou;
    data['relevansi_prodi'] = this.relevansiProdi;
    data['status'] = this.status;
    data['kerja_sama_dengan'] = this.kerjaSamaDengan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class LevelDocMoa {
  int? id;
  String? namaLevel;
  String? keterangan;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  LevelDocMoa(
      {this.id,
      this.namaLevel,
      this.keterangan,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  LevelDocMoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLevel = json['nama_level'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_level'] = this.namaLevel;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class JenisMoa {
  int? id;
  String? namaJenis;
  String? keterangan;
  String? createdAt;
  String? updatedAt;

  JenisMoa(
      {this.id,
      this.namaJenis,
      this.keterangan,
      this.createdAt,
      this.updatedAt});

  JenisMoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaJenis = json['nama_jenis'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_jenis'] = this.namaJenis;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RelevansiProdiMoa {
  int? id;
  String? namaProdi;
  Null? keterangan;
  Null? createdAt;
  Null? updatedAt;
  Null? deletedAt;

  RelevansiProdiMoa(
      {this.id,
      this.namaProdi,
      this.keterangan,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  RelevansiProdiMoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProdi = json['nama_prodi'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_prodi'] = this.namaProdi;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
