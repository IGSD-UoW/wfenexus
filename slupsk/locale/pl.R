# Strings translations.

# Edit the strings between "", making sure to preserve the double ".



# Menus -------------------------------------------------------------------

overview_menu <- "Zestawienie"
food_menu <- "Żywność"
water_menu <- "Woda"
energy_menu <- "Energia"
considerations_menu <- "Definicje i założenia"

distribution_menu <- "Dystrybucja"
description_menu <- "Opis"

# General -----------------------------------------------------------------

parents_string <- "Rodzice"
children_string <- "Dzieci"
kindergarten_string <- "Przedszkola"

rating_avg_string <- "Średnia ocena"
water_footprint_string <- "Ślad wodny"

# Overview ----------------------------------------------------------------

# Value boxes.
num_kindergartens <- "Przedszkola zaangażowane w projekt"
num_dishes <- "Liczba posiłków"
num_ingredients <- "Liczba produktów"
num_votes <- "Liczba ocen posiłków"

# Table and filters -------------------------------------------------------

name_string <- "Nazwa"
calories_string <- "Kalorie"
waste_string <- "Resztki po przygotowaniu posiłku"
allergen_string <- "Alergeny"

ingredient_string <- "Produkt"

meal_type_string <- "Typ"

produced_locally_string <- "Liczba ocen posiłków"


rating_children_string <- "Ocena (Dzieci)"
rating_parents_string <- "Ocena (Rodzice)"
rating_average_string <- "Ocena (średnia)"

health_string <- "Postrzegany poziom zdrowotności posiłku"
health_string_long <-  "Średnio oceniany przez rodziców postrzegany poziom zdrowotności posiłku. Wysokie wartości nie muszą oznaczać, że posiłek jest zdrowy."

water_used_string <- "Zużyta woda"
water_used_tooltip <- "Całkowita ilość zużytej wody, w oparciu o rzeczywiste pochodzenie składników. Wynika z sumy rzeczywistych śladów składników.**Jednostki: m3**"


emissions_transport_string <- "Emisje pochodzące z transportu"

co2_emissions_string <- "Wyemitowana ilość ton CO2"
co2_emissions_string_long <- "Całkowita ilosć wyemitowanych ton CO2 podczas transportu, w zależności od pochodzenia składników i środków transportu. **Jednostki: tona CO2**."

from_producer_string <- "Czy produkt jest wytwarzany w Polsce?"

weight_string <- "Waga (g)"




# Food --------------------------------------------------------------------

total_gr_animals <- "stosowane w produktach pochodzenia zwierzęcego"
total_gr_crops <- "stosowane w produktach pochodzenia roślinnego"

food_description <- paste0(
  "Ślad wodny posiłków i produktów żywnościowych Ślad wodny, który powstaje podczas przygotowywania posilków, to nie tylko woda, którą zużywamy do ich przygotowania. Oznacza ilość wody zużytą na wszystkich etapach produkcji produktów żywnościowych.\n",
  "niebieski ślad wodny  - woda pobrana ze źródel powierzchniowych oraz podziemnych, używana na przyklad w rolnictwie do nawadniania czy do mycia warzyw i owoców oraz gotowania\n",
  "zielony ślad wodny – odnosi się do wody opadowej zgromadzonej w warstwie gleby w strefie korzeniowej roślin, woda ta konieczna jest do wzrostu roślin \n",
  "szary ślad wodny  – odnosi się do wody, która jest konieczna do rozcieńczenia zanieczyszczeń powstałych w procesie produkcji przynajmniej do poziomu obowiązujacych standardów jakości")

# Plots
top5_kindergartens_title <- "5 najlepszych posiłków podawanych w przedszkolach"
top5_kindergartens_subtitle <- "Na podstawie średnich ocen wystawionych przez rodziców i dzieci"

top5_breakfast_title <-"5 najlepszych śniadań podawanych w przedszkolach"
top5_afternoon_title <- "5 najlepszych podwieczorków podawanych w przedszkolach"

ing_usg_wft_title <- "Zużycie składników a ślad wodny"
ing_usg_wft_subtitle <- ""
ing_usg_wft_x <- "Całkowita waga (g)"
ing_usg_wft_y <-"Średni ślad wodny (m3/tona)"
ing_usg_wft_color <- "Rodzaj żywności"

comparison_ratings_title <- "Porównanie ocen rodziców i dzieci"
comparison_ratings_subtitle <- top5_kindergartens_subtitle

rating_health_title <- "Średnia ocen w porównaniu do postrzeganego poziomu zdrowotności posiłków "
rating_health_x <- "Średnia ocena"
rating_health_y <- "Postrzegany poziom zdrowotności posiłkut"



# Water -------------------------------------------------------------------

vb_avg_water_animals_string <- "średnie światowe zapotrzebowanie na wodę, potrzebne do wypasania zwierząt wykorzystywanych do wytworzenia produktów pochodzenia zwierzęcego"
vb_avg_water_crops_string <- "średnie światowe zapotrzebowanie na wodę do uprawy roślin wykorzystywanych do wytorzenia produktów pochodzenia roślinnego"
vb_avg_water_animals_local_string <- "średni ślad wodny, gdyby te same zwierzęta były wypasane lokalnie"
vb_avg_water_crops_local_string <- "średni ślad wodny, gdyby te same uprawy były uprawiane lokalnie (jeśli to możliwe ze względu na warunki wzrostu)"

vb_tot_water_animals_string <- "całkowity ślad wodny przypadający na hodowlę zwierząt na całym świecie"
vb_tot_water_crops_string <- "całkowity ślad wodny przypadający na uprawy na całym świecie"
vb_tot_water_animals_local_string <- "calkowity ślad wodny, gdyby zwierzęta były wypasane lokalnie"
vb_tot_water_crops_local_string <- "całkowity ślad wodny w przypadku stosowania wyłącznie upraw lokalnych"


vb_total_water_string <- "Całkowity ślad wodny produktów pochodzenia zwierzęcego"

water_world_string <- "Ślad wodny (świat)"
water_world_tooltip <- "Całkowite zapotrzebowanie na wodę przy zastosowaniu średnich światowych, wynikające z sumowania całkowitego śladu wodnego wszystkich produktów. Wskźnik, który mierzy ilość zużywanej i zanieczyszczonej wody podczas produkcji towarów i usług do codziennego użytku.**Jednostki: m3**. _Ta miara słuzy jedynie do celów porównawczych i nie odzwierciedla rzeczywistego pochodzenia składników_.."

water_local_string <- "Ślad wodny (Polska)"
water_local_tooltip <- "Całkowite zapotrzebowanie na wodę, w sytuacji, w której wszystkie produkty byłyby produkowane lokalnie, wynikające z sumowania całkowitego śladu wodnego wszystkich produktów. Wskaźnik, który mierzy ilość zużywanej i zanieczyszczonej wody podczas produkcji towarów i usług do codziennego użytku. **Jednostki: m3**. _Ta miara służy jedynie do celów porównawczych i nie odzwierciedla rzeczywistego pochodzenia składników_.."

water_used_string <- "Zu?yta woda"
water_used_tooltip <- "Ca?kowita ilo?? zu?ytej wody, w oparciu o rzeczywiste pochodzenie sk?adnik?w. Wynika z sumy rzeczywistych ?lad?w sk?adnik?w.**Jednostki: m3**"


water_saving_string <- "Zaoszczędzona woda"
water_saving_tooltip <- "Różnica pomiędzy obecnym wyborem produktów w porównaniu do tych samych produktów przy zastosowaniu średnich światowych. Wartości ujemne oznaczają poządane zmniejszenie ilości wody."

water_blue_string <- "Niebieski ślad wodny"
water_blue_tooltip <- "Niebieski ślad wodny określa objętość wody powierzchniowej i podziemnej (gruntowej), która stała się częścią danego produktu oraz objętosć wody, która wyparowała do atmosfery w wyniku wytwarzania produktu. Dotyczy głównie nawadniania upraw, rolnictwa, przemysłu i użytkowania wody w gospodarstwach domowych, takich jak nawadnianie kwiatów lub gotowanie . **Jednostki: m3/tona**"

water_grey_string <- "Woda szara"
water_grey_tooltip <- "Woda zanieczyszczona przez przemys?. Jest ona odprowadzana do ?r?d?a wody lub oddawana do oczyszczalni ?ciek?w. Woda ta jest u?ywana do rozcie?czania ?ciek?w przemys?owych i komunalnych w celu spe?nienia wymaganych norm jako?ci. **Jednostki: m3/tona**"


water_total_string <- "Całkowity ślad wodny"
water_total_tooltip <- "Całkowity ślad wodny, wynikający z sumy zielonego, niebieskiego i szarego śladu wodnego. **Jednostki: m3/tona**"



wfp_avg_string <- "Ślad wodny (?rednia)"
wfp_avg_tooltip <- "Całkowity ślad wodny, przy zastosowaniu średnich światowych. **Jednostki: m3/tona**"

wfp_poland_string <- "?lad wodny (Polska)"
wfp_poland_tooltip <- "Ca?kowity ?lad wodny, przy za?o?eniu, ?e zosta? wyprodukowany w Polsce. **Jednostki: m3/tona**"

water_saving_potential_string <- "Potencjalne oszczędności wody"
water_saving_potential_tooltip <- "Różnica pomiędzy obecnym wyborem produktów w porównaniu do tych samych produktów produkowanych lokalnie. Wyższe wartości oznaczają większe możliwości poprawy."


water_green_string <- "Zielony ślad wodny"
water_green_tooltip <- "Zielony ślad wodny określa objętość wody pochodzącej z opadów atmosferycznych. Taka woda jest przechowywana w korzeniach roślin, gdzie naturalnie paruje lub jest pobierana przez rośliny. Jest szczególnie istotna dla produktów rolnych, ogrodniczych, przemyśle drzewnym. **Jednostki: m3/tona**"

water_blue_string <- "Niebieski ślad wodny"
water_blue_tooltip <- "Niebieski ślad wodny określa objętość wody powierzchniowej i podziemnej (gruntowej), która stała się częścią danego produktu oraz objętosć wody, która wyparowała do atmosfery w wyniku wytwarzania produktu. Dotyczy głównie nawadniania upraw, rolnictwa, przemysłu i użytkowania wody w gospodarstwach domowych, takich jak nawadnianie kwiatów lub gotowanie . **Jednostki: m3/tona**"

water_grey_string <- "Szary ślad wodny"
water_grey_tooltip <- "Szary ślad wodny określa objętość wody zanieczyszczonej przez przemysł. Woda ta jest używana do rozcieńczania ścieków przemysłowych i komunalnych w celu spełnienia wymaganych norm jakości. **Jednostki: m3/tona**"

water_total_string <- "Ca?kowity ?lad wodny"
water_total_tooltip <- "Ca?kowity ?lad wodny, wynikaj?cy z sumy zielonego, niebieskiego i szarego ?ladu wodnego. **Jednostki: m3/tona**"



wfp_avg_string <- "Ślad wodny (?rednia)"
wfp_avg_tooltip <- "Całkowity ślad wodny, przy zastosowaniu średnich światowych. **Jednostki: m3/tona**"

wfp_poland_string <- "Ślad wodny (Polska)"
wfp_poland_tooltip <- "Całkowity ślad wodny, przy założeniu, że został wyprodukowany w Polsce. **Jednostki: m3/tona**"

# Energy ------------------------------------------------------------------

vb_truck_emissions_string <- "jest emitowanych do atmosfery na kilometr przez ciężarówkę"
vb_train_emissions_string <- "jest emitowanych do atmosfery na kilometr przez pociąg"
vb_ferry_emissions_string <- "jest emitowanych do atmosfery na kilometr przez statek"
vb_plane_emissions_string <- "jest emitowanych do atmosfery na kilometr przez samolot"

comparison_rating_energy_title <- "Porównanie ocen i śladu eneregtycznego"



# Build a dataframe -------------------------------------------------------

# all_variables <- ls()
#
# #define empty vector
# values <- c()
#
#
# for(i in 1:length(all_variables)) {
#   values <- c(values, get(all_variables[[i]]))
#
#
# }
#
# tmp_df <- data.frame(
#   variable = all_variables,
#   value = values
# )
#
# readr::write_csv(tmp_df, file = "slupsk/locale/translations.csv")
# |
