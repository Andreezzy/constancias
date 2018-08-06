class DemoController < ApplicationController
  def index

  end
  def dowload
  	#template = Sablon.template(File.expand_path("#{Rails.root}/public/recipe_template.docx"))
  	template = Sablon.template(File.expand_path("#{Rails.root}/public/1.-RESOLUCION.docx"))
	context = {
	  title: "Fabulous Document",
	  technologies: ["Ruby", "HTML", "ODF"],
	  ingredients: [
	    {"name": "Ripened, chopped, medium sized tomatoes ", "amount": "6"},
	    {"name": "medium sized red (Spanish) onion", "amount": "1"},
	    {"name": "finely chopped cloves of garlic", "amount": "3 or 4"},
	    {"name": "fresh basil leaves finely chopped", "amount": "5 or 6"},
	    {"name": "a lemon's juice", "amount": "half"},
	    {"name": "of dried Oregano", "amount": "a small dash"},
	    {"name": "of balsamic vinegar", "amount": "a small dash"},
	    {"name": "olive oil, sea salt and cracked pepper", "amount": "to taste;"},
	    {"name": "grated cheese of your choice (romano/parmigiano/mozzarella)", "amount": "some"},
	    {"name": "Paola", "amount": "aaaaaaaaaaa"}
	  ],
	  EL_O_LA: "el",
	  sr_o_sra: "Sr",
	  APELLIDOS_Y_NOMBRES_O_RAZON_SOCIAL_: "JESUS ANTONY ARRATIA CAMA",
	  NOMBRE: "BODEGA ARRATIA",
	  AVJRPASAJE: "pasaje",
	  DIRECCION: "Av. 28 de Agosto",
	}
	template.render_to_file File.expand_path("#{Rails.root}/public/constancia.docx"), context
  	
  	send_file(
	    "#{Rails.root}/public/constancia.docx",
	    filename: "mi_constancia.docx",
	    type: "application/docx"
	  )
  end
end