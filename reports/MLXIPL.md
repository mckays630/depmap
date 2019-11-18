<h1>MLXIPL</h1>

<h2>Gene information</h2>
<details>
  <summary>Click to view the depmap.org information for MLXIPL</summary>
  <iframe src="https://depmap.org/portal/gene/MLXIPL?tab=about" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap overview</h2>
<details>
  <summary>Click to view the depmap.org summary for MLXIPL</summary>
  <iframe src="https://depmap.org/portal/gene/MLXIPL?tab=overview" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap expression</h2>
<details>
  <summary>Click to view the depmap.org expression data for MLXIPL</summary>
  <iframe src="https://depmap.org/portal/gene/MLXIPL?tab=characterization" style="border:none;width:100%;height:800px"></iframe>
</details>



<h2>Reactome Pathway diagram</h2>
ChREBP activates metabolic gene expression
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
        diagram.loadDiagram("R-HSA-163765");

        //Adding different listeners

        diagram.onDiagramLoaded(function (loaded) {
            console.info("Loaded ", loaded);
            diagram.flagItems("BAD");
	    diagram.flagItems("Q92934");
            if (loaded == "R-HSA-163765") diagram.selectItem("R-HSA-163765");
        });

     }
</script>



