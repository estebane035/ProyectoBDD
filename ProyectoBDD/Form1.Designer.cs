namespace ProyectoBDD
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnCrearBailarina = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnCrearBailarina
            // 
            this.btnCrearBailarina.Location = new System.Drawing.Point(12, 12);
            this.btnCrearBailarina.Name = "btnCrearBailarina";
            this.btnCrearBailarina.Size = new System.Drawing.Size(148, 51);
            this.btnCrearBailarina.TabIndex = 0;
            this.btnCrearBailarina.Text = "Bailarinas";
            this.btnCrearBailarina.UseVisualStyleBackColor = true;
            this.btnCrearBailarina.Click += new System.EventHandler(this.btnCrearBailarina_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(181, 241);
            this.Controls.Add(this.btnCrearBailarina);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCrearBailarina;
    }
}

