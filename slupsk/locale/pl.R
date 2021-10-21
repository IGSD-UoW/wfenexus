# Strings translations.

# Edit the strings between "", making sure to preserve the double ".



# Menus -------------------------------------------------------------------

overview_menu <- "Zestawienie"
food_menu <- "Żywność"
water_menu <- "Woda"
energy_menu <- "Energia"
considerations_menu <- "Definicje i rozważania"

distribution_menu <- "Dystrybucja"
description_menu <- "Opis"

# General -----------------------------------------------------------------

parents_string <- "Rodzice"
children_string <- "Dzieci"
kindergarten_string <- "Przedszkola"

rating_avg_string <- "?rednia ocena"
water_footprint_string <- "?lad wodny"

# Overview ----------------------------------------------------------------

# Value boxes.
num_kindergartens <- "Przedszkola zaanga?owane w projekt"
num_dishes <- "Liczba posi?k?w"
num_ingredients <- "Liczba produkt?w"
num_votes <- "Liczba ocen posi?k?w"

# Table and filters -------------------------------------------------------

name_string <- "Nazwa"
calories_string <- "Kalorie"
waste_string <- "Resztki po przygotowaniu posi?ku"
allergen_string <- "Alergeny"

ingredient_string <- "Produkt"

meal_type_string <- "Typ"

produced_locally_string <- "Czy produkt jest lokalny?"


rating_children_string <- "Ocena (Dzieci)"
rating_parents_string <- "Ocena (Rodzice)"
rating_average_string <- "Ocena (?rednia)"

health_string <- "Postrzegany poziom zdrowotno?ci posi?ku"
health_string_long <-  "?rdnio oceniany przez rodzic?w postrzegany poziom zdrowotno?ci posi?ku. Wysokie warto?ci nie musz? oznacza?, ?e posi?ek jest zdrowy."

water_used_string <- "Zu?yta woda"
water_used_tooltip <- "Ca?kowita ilo?? zu?ytej wody, b?d?ca sum? ?ladu wodnego ka?dego produktu w oparciu o miejsce produkcji, pomno?onego przez ilo?? gram?w. **Jednostki: m3**"


emissions_transport_string <- "Emisje pochodz?ce z transportu"

co2_emissions_string <- "Wyemitowana ilo?? ton CO2"
co2_emissions_string_long <- "Ca?kowita ilo?? wyemitowanych ton CO2 podczas transportu, w zale?no?ci od pochodzenia sk?adnik?w i ?rodk?w transportu. **Jednostki: tona CO2**."

from_producer_string <- "Czy produkt jest wytwarzany w Polsce?"

weight_string <- "Waga (g)"




# Food --------------------------------------------------------------------

total_gr_animals <- "used in ingredients from livestock origin"
total_gr_crops <- "used in ingredients from crops origin"

food_description <- paste0(
  "Ślad wodny posiłków i produktów żywnościowych \n &nbsp;",
  "Ślad wodny, który powstaje podczas przygotowywania posiłków, to nie tylko",
  "woda, którą zużywamy do ich przygotowania. Oznacza ilość wody zużytą na",
  "wszystkich etapach produkcji produktów żywnościowych. \n",
  "niebieski ślad wodny  - woda pobrana ze źródeł powierzchniowych oraz",
  "podziemnych, używana na przykład w rolnictwie do nawadniania czy do mycia",
  "warzyw i owoców oraz gotowania \n",
  "zielony ślad wodny – odnosi się do wody opadowej zgromadzonej w warstwie",
  "gleby w strefie korzeniowej roślin, woda ta konieczna jest do wzrostu",
  "roślin \n",
  "szary ślad wodny określa – odnosi się do wody, która jest konieczna do",
  "rozcieńczenia zanieczyszczeń powstałych w procesie produkcji przynajmniej",
  "do poziomu obowiązujących standardów jakości.\n")

# Plots
top5_kindergartens_title <- "5 najlepszych posi?k?w podawanych w przedszkolach"
top5_kindergartens_subtitle <- "Na podstawie ?rednich ocen wystawionych przez rodzic?w i dzieci"

top5_breakfast_title <-"5 najlepszych ?niada? podawanych w przedszkolach"
top5_afternoon_title <- "5 najlepszych podwieczork?w podawanych w przedszkolach"

ing_usg_wft_title <- "Zu?ycie sk?adnik?w a ?lad wodny"
ing_usg_wft_subtitle <- ""
ing_usg_wft_x <- "Ca?kowita waga (g)"
ing_usg_wft_y <-"?redni ?lad wodny (m3/tona)"
ing_usg_wft_color <- "Rodzaj ?ywno?ci"

comparison_ratings_title <- "Por?wnanie ocen rodzic?w i dzieci"
comparison_ratings_subtitle <- top5_kindergartens_subtitle

rating_health_title <- "?rednie ocen w por?wnaniu do postrzeganego poziomu zdrowotno?ci posi?k?w"
rating_health_x <- "?rednia ocena"
rating_health_y <- "Postrzegany poziom zdrowotno?ci posi?ku"



# Water -------------------------------------------------------------------

vb_avg_water_animals_string <- "to średnie światowe zapotrzebowanie na wodę potrzebne do wypasania ziwrząt wykorzystywanych do wytworzenia produktów  pochodzenia zwierzęcego"
vb_avg_water_crops_string <- "to średnie światowe zapotrzebowanie na wodę do uprawy roślin wykorzystywanych do wytorzenia produktów pochodzenia roślinnego"
vb_avg_water_animals_local_string <- "to średni ślad wodny, gdyby te same zwierzęta były wypasane lokalnie"
vb_avg_water_crops_local_string <- "to średni ślad wodny, jeśli te same uprawy byłyby uprawiane lokalnie (jeśli to możliwe ze względu na warunki wzrostu)"

vb_tot_water_animals_string <- "to całkowity ślad wodny przypadający na hodowlę zwierząt na całym świecie"
vb_tot_water_crops_string <- "to całkowity ślad wodny przypadający na uprawy na całym świecie"
vb_tot_water_animals_local_string <- "to całkowity ślad wodny, jeśli zwierzęta byłyby wypasane lokalnie"
vb_tot_water_crops_local_string <- "to całkowity ślad wodny w przypadku stosowania wyłącznie upraw lokalnych"


vb_total_water_string <- "Ca?kowity ?lad wodny produkt?w pochodzenia zwierz?cego"

water_world_string <- "?lad wodny (?wiat)"
water_world_tooltip <- "Ca?kowite zapotrzebowanie na wod? przy zastosowaniu ?rednich ?wiatowych, wynikaj?ce z sumowania ca?kowitego ?ladu wodnego wszystkich produkt?w. Wska?nik, kt?ry mierzy ilo?? zu?ywanej i zanieczyszczonej wody podczas produkcji towar?w i us?ug do codziennego u?ytku.**Jednostki: m3**. _Ta miara s?u?y jedynie do cel?w por?wnawczych i nie odzwierciedla rzeczywistego pochodzenia sk?adnik?w_.."

water_local_string <- "?lad wodny (Polska)"
water_local_tooltip <- "Ca?kowite zapotrzebowanie na wod?, w sytuacji, w kt?rej wszystkie produkty by?y produkowane lokalnie, wynikaj?ce z sumowania ca?kowitego ?ladu wodnego wszystkich produkt?w. Wska?nik, kt?ry mierzy ilo?? zu?ywanej i zanieczyszczonej wody podczas produkcji towar?w i us?ug do codziennego u?ytku. **Jednostki: m3**. _Ta miara s?u?y jedynie do cel?w por?wnawczych i nie odzwierciedla rzeczywistego pochodzenia sk?adnik?w_.."

water_used_string <- "Zu?yta woda"
water_used_tooltip <- "Ca?kowita ilo?? zu?ytej wody, w oparciu o rzeczywiste pochodzenie sk?adnik?w. Wynika z sumy rzeczywistych ?lad?w sk?adnik?w.**Jednostki: m3**"


water_saving_string <- "Zaoszcz?dzona woda"
water_saving_tooltip <- "R??nica pomi?dzy obecnym wyborem produkt?w w por?wnaniu do tych samych produkt?w przy zastosowaniu ?rednich ?wiatowych. Warto?ci ujemne oznaczaj? po??dane zmniejszenie ilo?ci wody."

water_blue_string <- "Woda niebieska"
water_blue_tooltip <- "To woda powierzchniowa i podziemna (gruntowa), kt?ra sta?a si? cz??ci? danego produktu oraz woda, kt?ra wyparowa?a do atmosfery w wyniku wytwarzania produktu. Dotyczy g??wnie nawadniania upraw, rolnictwa, przemys?u i u?ytkowania wody w gospodarstwach domowych, takich jak nawadnianie kwiat?w lub gotowanie. **Jednostki: m3/tona**"

water_grey_string <- "Woda szara"
water_grey_tooltip <- "Woda zanieczyszczona przez przemys?. Jest ona odprowadzana do ?r?d?a wody lub oddawana do oczyszczalni ?ciek?w. Woda ta jest u?ywana do rozcie?czania ?ciek?w przemys?owych i komunalnych w celu spe?nienia wymaganych norm jako?ci. **Jednostki: m3/tona**"


water_total_string <- "Ca?kowity ?lad wodny"
water_total_tooltip <- "Ca?kowity ?lad wodny, wynikaj?cy z sumy zielonego, niebieskiego i szarego ?ladu wodnego. **Jednostki: m3/tona**"



wfp_avg_string <- "?lad wodny (?rednia)"
wfp_avg_tooltip <- "Ca?kowity ?lad wodny, przy zastosowaniu ?rednich ?wiatowych. **Jednostki: m3/tona**"

wfp_poland_string <- "?lad wodny (Polska)"
wfp_poland_tooltip <- "Ca?kowity ?lad wodny, przy za?o?eniu, ?e zosta? wyprodukowany w Polsce. **Jednostki: m3/tona**"

water_saving_potential_string <- "Potencjalne oszcz?dno?ci wody"
water_saving_potential_tooltip <- "R??nica pomi?dzy obecnym wyborem produkt?w w por?wnaniu do tych samych produkt?w produkowanych lokalnie. Wy?sze warto?ci oznaczaj? wi?ksze mo?liwo?ci poprawy."


water_green_string <- "Zielony ?lad wodny"
water_green_tooltip <- "Zielony ?lad wodny okre?la obj?to?? wody pochodz?cej z opad?w atmosferycznych. Taka woda jest przechowywana w korzeniach ro?lin, gdzie naturalnie paruje lub jest pobierana przez ro?liny. Jest szczeg?lnie istotna dla produkt?w rolnych, ogrodniczych, przemy?le drzewnym. **Jednostki: m3/tona**"

water_blue_string <- "Niebieski ?lad wodny"
water_blue_tooltip <- "Niebieski ?lad wodny okre?la obj?to?? wody powierzchniowej i podziemnej (gruntowej), kt?ra sta?a si? cz??ci? danego produktu oraz objeto?? wody, kt?ra wyparowa?a do atmosfery w wyniku wytwarzania produktu. Dotyczy g??wnie nawadniania upraw, rolnictwa, przemys?u i u?ytkowania wody w gospodarstwach domowych, takich jak nawadnianie kwiat?w lub gotowanie . **Jednostki: m3/tona**"

water_grey_string <- "Szary ?lad wodny"
water_grey_tooltip <- "Szary ?lad wodny okre?la objeto?? wody zanieczyszczonej przez przemys?. Jest ona odprowadzana do ?r?d?a wody lub oddawana do oczyszczalni ?ciek?w. Woda ta jest u?ywana do rozcie?czania ?ciek?w przemys?owych i komunalnych w celu spe?nienia wymaganych norm jako?ci. **Jednostki: m3/tona**"

water_total_string <- "Ca?kowity ?lad wodny"
water_total_tooltip <- "Ca?kowity ?lad wodny, wynikaj?cy z sumy zielonego, niebieskiego i szarego ?ladu wodnego. **Jednostki: m3/tona**"



wfp_avg_string <- "?lad wodny (?rednia)"
wfp_avg_tooltip <- "Ca?kowity ?lad wodny, przy zastosowaniu ?rednich ?wiatowych. **Jednostki: m3/tona**"

wfp_poland_string <- "?lad wodny (Polska)"
wfp_poland_tooltip <- "Ca?kowity ?lad wodny, przy za?o?eniu, ?e zosta? wyprodukowany w Polsce. **Jednostki: m3/tona**"

# Energy ------------------------------------------------------------------

vb_truck_emissions_string <- "są emitowane do atmosfery na kilometr przez ciężarówkę"
vb_train_emissions_string <- "są emitowane do atmosfery na kilometr pociągiem"
vb_ferry_emissions_string <- "są emitowane do atmosfery na kilometr przez statek"
vb_plane_emissions_string <- "są emitowane do atmosfery na kilometr przez samolot"

comparison_rating_energy_title <- "Por?wnanie ocen i ?ladu eneregtycznego"

