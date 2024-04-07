﻿using OtoServis.DataAccess;
using OtoServis.DataAccess.Context;
using OtoServis.Dto;
using OtoServis.Helper;

namespace OtoServis
{
    public partial class FrmAracYonetimPaneli : Form
    {
        private readonly AppDbContext dbContext;
        private bool isSaving = true;
        public FrmAracYonetimPaneli()
        {
            InitializeComponent();
            dbContext = DbContextBuilder.Build();
        }


        void MusterileriYukle()
        {
            var data = dbContext.Musteriler.Select(x => new TextValueDto<int>
            {
                Text = $"{x.Ad} {x.Soyad} - ({x.Telefon})",
                Value = x.MusteriID

            }).ToList();

            data.Insert(0, new TextValueDto<int>
            {
                Text = "Seçiniz",
                Value = -1
            });

            ComboBoxHelper.LoadData(cmbMusteri, data, "Text", "Value");
        }

        void AracEkle()
        {
            var secilenMusteri = cmbMusteri.SelectedItem as TextValueDto<int>;
            var secilenMarka = cmbMarka.SelectedItem as TextValueDto<int>;
            var secilenModel = cmbModel.SelectedItem as TextValueDto<int>;

            if (secilenMusteri.Value == -1)
            {
                MessageBox.Show("Müşteri seçiniz", "OtoServis", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }



            string plaka = txtPlaka.Text.Trim();
            string renk = txtRenk.Text.Trim();
            string yil = txtYil.Text.Trim();


        }

        void MarkalariYukle()
        {
            var data = dbContext.Markalar.Select(x => new TextValueDto<int>
            {
                Text = x.MarkaAdi,
                Value = x.MarkaID
            }).ToList();


            data.Insert(0, new TextValueDto<int>
            {
                Text = "Seçiniz",
                Value = -1
            });

            ComboBoxHelper.LoadData(cmbMarka, data, "Text", "Value");
        }

        void ModelleriYukle(int markaId)
        {
            var data = dbContext.Modeller
                .Where(x => x.MarkaID == markaId)
                .Select(x => new TextValueDto<int>
                {
                    Text = x.ModelAdi,
                    Value = x.ModelID
                }).ToList();

            data.Insert(0, new TextValueDto<int>
            {
                Text = "Seçiniz",
                Value = -1
            });

            ComboBoxHelper.LoadData(cmbModel, data, "Text", "Value");
        }

        private void FrmAracYonetimPaneli_Load(object sender, EventArgs e)
        {
            MusterileriYukle();
            MarkalariYukle();
        }

        private void cmbMarka_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextValueDto<int> selectedData = cmbMarka.SelectedItem as TextValueDto<int>;

            if (selectedData != null)
            {
                ModelleriYukle(selectedData.Value);
            }
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            AracEkle();
        }
    }
}
