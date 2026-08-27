
ALTER TABLE `donvi`
  ADD COLUMN `ma_don_vi_app_bdu_assistant` INT NULL DEFAULT NULL
  COMMENT 'Ma don vi tuong ung ben app BDU Assistant; NULL = chua anh xa'
  AFTER `suDungSoKyHieuBaoCao`;

ALTER TABLE `donvi`
  ADD UNIQUE KEY `uq_donvi_ma_don_vi_app_bdu_assistant` (`ma_don_vi_app_bdu_assistant`);

-- -----------------------------------------------------------------------------
-- 2. Nap du lieu anh xa
--    Chi cap nhat theo maDonVi cua BCTM, doi chieu bang ten don vi.
--    Nhung don vi khong khop hoac khong chac thi khong co trong danh sach nay
--    -> giu NULL (xem muc 4).
-- -----------------------------------------------------------------------------
UPDATE `donvi` SET `ma_don_vi_app_bdu_assistant` = CASE `maDonVi`
    -- ===== Co so chinh =====
    WHEN 1  THEN 5   -- Vien Tri tue nhan tao va Chuyen doi so
    WHEN 2  THEN 1   -- Khoa Cong nghe thong tin
    WHEN 3  THEN 2   -- Khoa Dien - Dien tu            <- 'Khoa Dien, Dien Tu'
    WHEN 4  THEN 68  -- Trung tam Ha tang so
    WHEN 5  THEN 67  -- Trung tam Chuyen doi so
    WHEN 6  THEN 66  -- Trung tam STEAM AI
    WHEN 10 THEN 9   -- Phong Tong hop
    WHEN 14 THEN 6   -- Phong Bao dam Chat luong va Khao thi
    WHEN 15 THEN 10  -- Phong Tai chinh ke toan        <- 'Phong Tai chinh - Ke toan'
    WHEN 17 THEN 34  -- Khoa Cong nghe thuc pham
    WHEN 18 THEN 41  -- Vien Dao tao va Nghien cuu Duoc hoc
    WHEN 19 THEN 22  -- Khoa Kinh te
    WHEN 20 THEN 43  -- Khoa Nhat Ban hoc
    WHEN 21 THEN 4   -- Phong Dao tao
    WHEN 22 THEN 8   -- Thu vien                       <- 'Trung tam Luu tru va Thu vien'
    WHEN 23 THEN 25  -- Khoa Cong nghe ky thuat o to
    WHEN 24 THEN 42  -- Vien Cong nghe xay dung va Giao thong do thi
    WHEN 25 THEN 45  -- Khoa Han Quoc hoc
    WHEN 26 THEN 11  -- Phong Tuyen sinh (co so chinh)
    WHEN 27 THEN 33  -- Khoa Luat Kinh te
    WHEN 28 THEN 31  -- Hoc vien King Sejong Binh Duong
    WHEN 29 THEN 30  -- Khoa Xa hoi hoc - Truyen thong
    WHEN 30 THEN 32  -- Trung tam Hoat dong sinh vien va Quan he doanh nghiep
    WHEN 33 THEN 40  -- Vien Dao tao Lien tuc, Phuc vu Cong dong
    WHEN 34 THEN 44  -- Ban giam hieu
    WHEN 49 THEN 35  -- Khoa Luat
    WHEN 50 THEN 12  -- Trung tam Tin hoc va Ngoai ngu
    WHEN 51 THEN 14  -- Phong Thanh tra - Phap che va Kiem toan noi bo
    WHEN 52 THEN 16  -- Van phong Doan Thanh nien - Hoi Sinh vien
    WHEN 53 THEN 23  -- Khoa Ngoai ngu
    WHEN 55 THEN 19  -- Khoa Quan tri Cong nghiep va Logistics
    WHEN 62 THEN 17  -- Phong Quan ly khoa hoc va Hop tac quoc te
                     --   <- 'Phong Quan ly khoa hoc va Quan he doi ngoai'
                     --   (maDonVi 16 cung ten nhung da ngung hoat dong)
    -- ===== Phan hieu Ca Mau (PHCM) =====
    WHEN 35 THEN 55  -- Phan hieu Truong DH Binh Duong tai Ca Mau <- 'Ban Giam Doc - PHCM'
    WHEN 36 THEN 58  -- Phong Hanh chinh - Tong hop - PHCM
    WHEN 37 THEN 56  -- Phong Dao tao - Khao thi va Bao dam chat luong - PHCM
    WHEN 38 THEN 60  -- Phong Tuyen sinh - PHCM
    WHEN 39 THEN 59  -- Phong Tai chinh - Ke toan - PHCM
    WHEN 40 THEN 57  -- Phong Cong tac sinh vien va Doan Hoi - PHCM
    WHEN 41 THEN 61  -- Trung tam Ngoai ngu - Tin hoc - PHCM
    WHEN 42 THEN 63  -- Phong Quan he doanh nghiep va Khoi nghiep - PHCM
    WHEN 43 THEN 62  -- Phong Quan li Khoa hoc va Chuyen doi so - PHCM
    ELSE `ma_don_vi_app_bdu_assistant`
  END
WHERE `maDonVi` IN (
  1,2,3,4,5,6,10,14,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,33,34,35,
  36,37,38,39,40,41,42,43,49,50,51,52,53,55,62
);

UPDATE `donvi` SET `ma_don_vi_app_bdu_assistant` = NULL
WHERE `maDonVi` IN (7,8,9,11,12,13,16,32,56,57,58,59,60,61,64,65);

