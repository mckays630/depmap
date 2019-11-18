<h1>ERBB2</h1>

<h2>Gene information</h2>
<iframe src="https://depmap.org/portal/gene/FADD?tab=about" style="border:none;width:100%;height:800px"></iframe>

<h2>Depmap overview</h2>
<details>
  <summary>Click to view the depmap.org summary for FADD</summary>
  <iframe src="https://depmap.org/portal/gene/FADD?tab=overview" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap expression</h2>
<details>
  <summary>Click to view the depmap.org expression data for FADD</summary>
  <iframe src="https://depmap.org/portal/gene/FADD?tab=characterization" style="border:none;width:100%;height:800px"></iframe>
</details>



<h2>Reactome Pathway diagram</h2>
NF-kB activation through FADD/RIP-1 pathway mediated by caspase-8 and -10
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
        diagram.loadDiagram("R-HSA-933543");

        //Adding different listeners

        diagram.onDiagramLoaded(function (loaded) {
            console.info("Loaded ", loaded);
            diagram.flagItems("BAD");
	    diagram.flagItems("Q92934");
            if (loaded == "R-HSA-933543") diagram.selectItem("R-HSA-933543");
        });

     }
</script>



