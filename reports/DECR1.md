<h1>DECR1</h1>

<h2>Gene information</h2>
<details>
  <summary>Click to view the depmap.org information for DECR1</summary>
  <iframe src="https://depmap.org/portal/gene/DECR1?tab=about" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap overview</h2>
<details>
  <summary>Click to view the depmap.org summary for DECR1</summary>
  <iframe src="https://depmap.org/portal/gene/DECR1?tab=overview" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap expression</h2>
<details>
  <summary>Click to view the depmap.org expression data for DECR1</summary>
  <iframe src="https://depmap.org/portal/gene/DECR1?tab=characterization" style="border:none;width:100%;height:800px"></iframe>
</details>



<h2>Reactome Pathway diagram</h2>
mitochondrial fatty acid beta-oxidation of unsaturated fatty acids
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
        diagram.loadDiagram("R-HSA-77288");

        //Adding different listeners

        diagram.onDiagramLoaded(function (loaded) {
            console.info("Loaded ", loaded);
            diagram.flagItems("BAD");
	    diagram.flagItems("Q92934");
            if (loaded == "R-HSA-77288") diagram.selectItem("R-HSA-77288");
        });

     }
</script>



