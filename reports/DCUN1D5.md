<h1>DCUN1D5</h1>

<h2>Gene information</h2>
<details>
  <summary>Click to view the depmap.org information for DCUN1D5</summary>
  <iframe src="https://depmap.org/portal/gene/DCUN1D5?tab=about" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap overview</h2>
<details>
  <summary>Click to view the depmap.org summary for DCUN1D5</summary>
  <iframe src="https://depmap.org/portal/gene/DCUN1D5?tab=overview" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap expression</h2>
<details>
  <summary>Click to view the depmap.org expression data for DCUN1D5</summary>
  <iframe src="https://depmap.org/portal/gene/DCUN1D5?tab=characterization" style="border:none;width:100%;height:800px"></iframe>
</details>



<h2>Reactome Pathway diagram</h2>
Neddylation
<div id="diagramHolder"></div>

<script>
    //Creating the Reactome Diagram widget
    //Take into account a proxy needs to be set up in your server side pointing to www.reactome.org
    function onReactomeDiagramReady(){  //This function is automatically called when the widget code is ready to be used
        var diagram = Reactome.Diagram.create({
            "placeHolder" : "diagramHolder",
            "width" : 900,
            "height" : 500
        });

        //Initialising it to the "Hemostasis" pathway
        diagram.loadDiagram("R-HSA-8951664");

        //Adding different listeners

        diagram.onDiagramLoaded(function (loaded) {
            console.info("Loaded ", loaded);
            diagram.flagItems("BAD");
	    diagram.flagItems("Q92934");
            if (loaded == "R-HSA-8951664") diagram.selectItem("R-HSA-8951664");
        });

     }
</script>



