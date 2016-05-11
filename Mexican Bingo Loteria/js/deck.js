var delay=2500; //set delay in miliseconds
var curindex=0;
var myimages= [];
	myimages[0]="img/1 El Gallo.jpg"
	myimages[1]="img/2 El Diablito.jpg"
	myimages[2]="img/3 La Dama.jpg"
	myimages[3]="img/4 El Catrin.jpg"
	myimages[4]="img/5 El Paraguas.jpg"
	myimages[5]="img/6 La Sirena.jpg"
	myimages[6]="img/7 La Escalera.jpg"
	myimages[7]="img/8 La Botella.jpg"
	myimages[8]="img/9 El Barril.jpg"
	myimages[9]="img/10 El Arbol.jpg"
	myimages[10]="img/11 El Melon.jpg"
	myimages[11]="img/12 El Valiente.jpg"
	myimages[12]="img/13 El Gorrito.jpg"
	myimages[13]="img/14 La Muerte.jpg"
	myimages[14]="img/15 La Pera.jpg"
	myimages[15]="img/16 La Bandera.jpg"
	myimages[16]="img/17 El Bandolon.jpg"
	myimages[17]="img/18 El Violoncello.jpg"
	myimages[18]="img/19 La Garza.jpg"
	myimages[19]="img/20 El Pajaro.jpg"
	myimages[20]="img/21 El Mano.jpg"
	myimages[21]="img/22 La Bota.jpg"
	myimages[22]="img/23 La Luna.jpg"
	myimages[23]="img/24 El Cotorro.jpg"
	myimages[24]="img/25 El Borracho.jpg"
	myimages[25]="img/26 El Negrito.jpg"
	myimages[26]="img/27 El Corazon.jpg"
	myimages[27]="img/28 La Sandia.jpg"
	myimages[28]="img/29 El Tambor.jpg"
	myimages[29]="img/30 El Camaron.jpg"
	myimages[30]="img/31 Las Jaras.jpg"
	myimages[31]="img/32 El Musico.jpg"
	myimages[32]="img/33 La Arana.jpg"
	myimages[33]="img/34 El Soldado.jpg"
	myimages[34]="img/35 La Estrella.jpg"
	myimages[35]="img/36 El Cazo.jpg"
	myimages[36]="img/37 El Mundo.jpg"
	myimages[37]="img/38 El Apache.jpg"
	myimages[38]="img/39 El Nopal.jpg"
	myimages[39]="img/40 El Alacran.jpg"
	myimages[40]="img/41 La Rosa.jpg"
	myimages[41]="img/42 La Calavera.jpg"
	myimages[42]="img/43 La Campana.jpg"
	myimages[43]="img/44 El Cantarito.jpg"
	myimages[44]="img/45 El Venado.jpg"
	myimages[45]="img/46 El Sol.jpg"
	myimages[46]="img/47 La Corona.jpg"
	myimages[47]="img/48 La Chalupa.jpg"
	myimages[48]="img/49 El Pino.jpg"
	myimages[49]="img/50 El Pescado.jpg"
	myimages[50]="img/51 La Palma.jpg"
	myimages[51]="img/52 La Maceta.jpg"
	myimages[52]="img/53 El Arpa.jpg"
	myimages[53]="img/54 La Rana.jpg"

    var irand = Math.floor(Math.random()*(myimages.length));
    document.write('<img id="deck" name="defaultimage" src="'+myimages[irand]+'">');
    var shown = [];
    shown[irand] = true;

    function rotateimage()
    {
        var itemp = Math.floor(Math.random()*(myimages.length));
        if(shown[itemp])
           return;
        document.images.defaultimage.src=myimages[itemp];
        shown[itemp] = true;
        if (shown.length == 53){
            shown.pop();
        }
        console.log(myimages[itemp])
    }

    function startGameCaller(){
    	setInterval(rotateimage, delay);
    }
