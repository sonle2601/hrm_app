class InformationModel {
  String? email;
  String? hoTen;
  String? soCmnd;
  String? soDienThoai;
  String? thanhPho;
  String? huyen;
  String? xa;
  String? soNha;
  String? gioiTinh;
  String? namSinh;
  String? anhMatTruoc;
  String? anhMatSau;
  String? nganHang;
  String? soTaiKhoan;

  InformationModel(
      {this.email,
        this.hoTen,
        this.soCmnd,
        this.soDienThoai,
        this.thanhPho,
        this.huyen,
        this.xa,
        this.soNha,
        this.gioiTinh,
        this.namSinh,
        this.anhMatTruoc,
        this.anhMatSau,
        this.nganHang,
        this.soTaiKhoan,
});

  InformationModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    hoTen = json['ho_ten'];
    soCmnd = json['so_cmnd'];
    soDienThoai = json['so_dien_thoai'];
    thanhPho = json['thanh_pho'];
    huyen = json['huyen'];
    xa = json['xa'];
    soNha = json['so_nha'];
    gioiTinh = json['gioi_tinh'];
    namSinh = json['nam_sinh'];
    anhMatTruoc = json['anh_mat_truoc'];
    anhMatSau = json['anh_mat_sau'];
    nganHang = json['ngan_hang'];
    soTaiKhoan = json['so_tai_khoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (nganHang != null) {
      data['ngan_hang'] = this.nganHang;
    }
    if (soTaiKhoan != null) {
      data['so_tai_khoan'] = this.soTaiKhoan;
    }
    data['email'] = this.email;
    data['ho_ten'] = this.hoTen;
    data['so_cmnd'] = this.soCmnd;
    data['so_dien_thoai'] = this.soDienThoai;
    data['thanh_pho'] = this.thanhPho;
    data['huyen'] = this.huyen;
    data['xa'] = this.xa;
    data['so_nha'] = this.soNha;
    data['gioi_tinh'] = this.gioiTinh;
    data['nam_sinh'] = this.namSinh;
    data['anh_mat_truoc'] = this.anhMatTruoc;
    data['anh_mat_sau'] = this.anhMatSau;
    return data;
  }
}