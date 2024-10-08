﻿using Microsoft.EntityFrameworkCore;
using OtoServis.DataAccess;
using OtoServis.DataAccess.Context;
using OtoServis.DataAccess.Entities;
using OtoServis.Dto;
using OtoServis.Helper;
using System.Data;

namespace OtoServis
{
    public partial class FrmPersonelPaneli : Form
    {
        private readonly AppDbContext dbContext;
        private bool isSaving = true;

        public bool GoruntulemeYetkisiVarmi { get; set; }
        public bool DuzenlemeYetkisiVarmi { get; set; }
        public bool EklemeYetkisiVarmi { get; set; }
        public bool SilmeYetkisiVarmi { get; set; }

        public FrmPersonelPaneli()
        {
            InitializeComponent();

            dbContext = DbContextBuilder.Build();
        }

        void RolleriYukle()
        {
            var roller = dbContext.Roller.ToList();
            roller.Insert(0, new Rol
            {
                RolAdi = "Seçiniz",
                RolID = -1
            });

            ComboBoxHelper.LoadData(cmbRol, roller, "RolAdi", "RolID");
        }

        void PersonelleriYukle()
        {
            if (!GoruntulemeYetkisiVarmi) return;

            var personeller = dbContext.Personeller
                .Include(p => p.Rol)
                .Where(p => !p.Silindimi)
                .Select(p => new PersonelDto
                {

                    Ad = p.Ad,
                    Soyad = p.Soyad,
                    Email = p.Email,
                    Durum = p.Aktifmi ? "Aktif" : "Pasif",
                    Rol = p.Rol.RolAdi,
                    Data = p
                }).ToList();

            DataGridViewHelper.LoadData<PersonelDto>(dgvPersonel, personeller);
        }

        void PersonelAktifPasifDurumlariYukle()
        {
            cmbPersonelAktifPasif.Items.Add(new TextValueDto<bool?> { Text = "Seçiniz", Value = null });
            cmbPersonelAktifPasif.Items.Add(new TextValueDto<bool?> { Text = "Aktif", Value = true });
            cmbPersonelAktifPasif.Items.Add(new TextValueDto<bool?> { Text = "Pasif", Value = false });
            cmbPersonelAktifPasif.DisplayMember = "Text";
            cmbPersonelAktifPasif.ValueMember = "Value";
            cmbPersonelAktifPasif.SelectedIndex = 0;
        }
        void LoadData()
        {
            RolleriYukle();
            PersonelleriYukle();
            PersonelAktifPasifDurumlariYukle();
        }

        void PersonelEkle()
        {
            if (!EklemeYetkisiVarmi) return;

            if (cmbRol.SelectedIndex == 0)
            {
                MessageBox.Show("Rol Seçiniz", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            if (cmbPersonelAktifPasif.SelectedIndex == 0)
            {
                MessageBox.Show("Personel Durum Seçiniz", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            string ad = txtAd.Text;
            string soyad = txtSoyad.Text;
            string email = txtEmail.Text;
            string sifre = txtSifre.Text;
            var rol = cmbRol.SelectedItem as Rol;

            bool emailKayitlimi = dbContext.Personeller.Any(p => p.Email == email);

            if (emailKayitlimi)
            {
                MessageBox.Show("Bu email kullanımda", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            dbContext.Personeller.Add(new Personel
            {
                Ad = ad,
                Soyad = soyad,
                Email = email,
                Sifre = sifre,
                RolID = rol.RolID
            });

            dbContext.SaveChanges();
            inputlariTemizle();
            PersonelleriYukle();
            MessageBox.Show("Kaydedildi", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        void PersonelGuncelle()
        {
            if (!DuzenlemeYetkisiVarmi) return;

            if (cmbRol.SelectedIndex == 0)
            {
                MessageBox.Show("Rol Seçiniz", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            if (cmbPersonelAktifPasif.SelectedIndex == 0)
            {
                MessageBox.Show("Personel Durum Seçiniz", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            var (ok, personel) = DataGridViewHelper.GetSelectedValue<PersonelDto>(dgvPersonel);

            if (!ok)
            {
                MessageBox.Show("Güncellenecek Kayıt Yok", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            string ad = txtAd.Text;
            string soyad = txtSoyad.Text;
            string email = txtEmail.Text;
            string sifre = txtSifre.Text;
            var rol = cmbRol.SelectedItem as Rol;
            var aktifPasifDurum = cmbPersonelAktifPasif.SelectedItem as TextValueDto<bool?>;

            bool emailKayitlimi = dbContext.Personeller.Any(p => personel.Data.PersonelID != p.PersonelID && p.Email == email);

            if (emailKayitlimi)
            {
                MessageBox.Show("Bu email kullanımda", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            personel.Data.Ad = ad;
            personel.Data.Soyad = soyad;
            personel.Data.Email = email;
            personel.Data.Sifre = sifre;
            personel.Data.RolID = rol.RolID;
            personel.Data.Aktifmi = aktifPasifDurum.Value.Value;

            dbContext.Entry<Personel>(personel.Data).State = EntityState.Modified;

            dbContext.SaveChanges();

            isSaving = true;
            inputlariTemizle();
            PersonelleriYukle();
            MessageBox.Show("Kaydedildi", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        void inputlariTemizle()
        {
            txtAd.Clear();
            txtSoyad.Clear();
            txtEmail.Clear();
            txtSifre.Clear();
            cmbRol.SelectedIndex = 0;
            cmbPersonelAktifPasif.SelectedIndex = 0;
            isSaving = true;
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {

                if (isSaving) PersonelEkle(); else PersonelGuncelle();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void FrmPersonelYonetim_FormClosing(object sender, FormClosingEventArgs e)
        {
            dbContext.Dispose();
        }

        private void FrmPersonelYonetim_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void dgvPersonel_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (!DuzenlemeYetkisiVarmi) return;

            var (ok, personel) = DataGridViewHelper.GetSelectedValue<PersonelDto>(dgvPersonel);

            if (!ok) return;

            txtAd.Text = personel.Ad;
            txtSoyad.Text = personel.Soyad;
            txtEmail.Text = personel.Email;
            txtSifre.Text = personel.Data.Sifre;
            cmbRol.SelectedItem = personel.Data.Rol;
            ComboBoxHelper.SelectItemByValue<bool?>(cmbPersonelAktifPasif, personel.Data.Aktifmi);
            isSaving = false;
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            if (!SilmeYetkisiVarmi) return;

            if (isSaving)
            {
                MessageBox.Show("Silmek için kayıt seçin", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            var (ok, personel) = DataGridViewHelper.GetSelectedValue<PersonelDto>(dgvPersonel);

            if (!ok)
            {
                MessageBox.Show("Silmek için kayıt seçin", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            DialogResult dialogResult = MessageBox.Show("Bu kaydı silmek istediğinize emin misiniz ?", "OtoServis", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dialogResult == DialogResult.No)
            {
                return;
            }

            personel.Data.Silindimi = true;

            dbContext.Entry<Personel>(personel.Data).State = EntityState.Modified;
            dbContext.SaveChanges();
            inputlariTemizle();
            PersonelleriYukle();
            MessageBox.Show("Kayıt silindi", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
