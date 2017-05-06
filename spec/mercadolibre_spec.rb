RSpec.describe "Examen tecnico mercadolibre", type: :feature, js: true do

    it "Proceso de compra" do
      #TODO try to stop using text to identify elements
      visit "http://www.mercadolibre.com.ar/"
      click_on "Ingresa"
      find("#user_id").set("TEST3JKKR44N")
      click_on "Continuar"
      find("#password").set("qatest2574")
      click_on "Ingresar"
      find(".nav-search-input").set("item de testeo")
      find(".nav-search-btn").click
      find(".list-view-item-title", match: :first).click
      find("#BidButtonTop").click
      click_on "Continuar"
      click_on "Continuar"
      select "Rapipago", from: "paymentMethodSelect"
      click_on "Continuar"
      click_on "Confirmar"
      expect(page).to have_content("Rapipago")
    end

end