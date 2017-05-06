RSpec.describe "Examen tecnico mercadolibre", type: :feature, js: true do
    it "Proceso de compra" do
      visit "http://www.mercadolibre.com.ar/"
      login
      search_for("item de testeo")
      select_first_product
      buy
      click_continue
      click_continue
      select_payment_method("Rapipago")
      click_continue
      click_confirm
      check_page_for("Rapipago")
    end
end

def login
  #User and pass could be parametrized and extracted from a configuration file or ENV variable
  #TODO change text button for an appropiate selector
  click_on "Ingresa"
  find("#user_id").set("TEST3JKKR44N")
  click_on "Continuar"
  find("#password").set("qatest2574")
  click_on "Ingresar"
end

def search_for(item)
  find(".nav-search-input").set(item)
  find(".nav-search-btn").click
end

def select_first_product
  find(".list-view-item-title", match: :first).click
end

def buy
  find("#BidButtonTop").click
end

def click_continue
  #TODO change text button for an appropiate selector
  click_on "Continuar"
end

def select_payment_method(payment_method)
  select payment_method, from: "paymentMethodSelect"
end

def click_confirm
  #TODO change text button for an appropiate selector
  click_on "Confirmar"
end

def check_page_for(text)
  #TODO assert that current page is correct by some element, not using text
  expect(page).to have_content("Rapipago")
end