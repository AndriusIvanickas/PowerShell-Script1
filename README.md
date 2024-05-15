# PowerShell-Script

Sukurkite PowerShell scriptą kuris padėtu surasti, visus servisus esančius sistemoje ir pagal suteiktus parametrus galėtu juos paleisti, išvesti informaciją apie juos.

Techniniai reikalavimai:
1)	Išsitraukti visus servisus esančius sistemoje ir juos išrikiuoti pagal statusą. (Get-Service) (1t.)
2)	Viso script veikimo metu turi būti įrašomi (loginami) visi daromi veiksmai (Start-Transcript arba jūsų pasirinktos funkcijos), taip pat failas neturi būti perrašomas, jeigu yra paleidžiama kita operacija. (2t.)
3)	Pagal perduotus parametrus (array forma) nuspręsti kurie procesai turėtu veikti ir kurie ne, ir atlikti pataisymus.(Start-Service / Stop-Service) (1t.)
4)	Visos operacijos, kaip Start-Service turi būti implementuotos su try / catch ir turi būti talpinamos tarp funkcijų. Nesekmės atvejų atitinkamos žinutės turi būti išvedamos į konsolę. (1t.)
5)	Sukonstruokitę objektą visų sėkmingai paleistų ir sustabdytu servisų su jų informaciją, turi būti aišku kurie servisai buvo sustabdyti o kurie paleisti. Objektą talpinkite masyve (array). (2t.)
6)	Informaciją objektuose sutalpinkite į CSV formato failą ir išsaugokite vartotojo pageidaujamoje lokacijoje. Jeigu lokacija nėra galima vartotojui turi būti išmestas pranešimas ir prašomas papildomas lokacijos įvedimas. (2t.)
7)	Atgal suimportuokite išvestą CSV failą ir išveskite jo reikšmes (1t.)
