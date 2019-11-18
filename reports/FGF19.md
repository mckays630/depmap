<h1>FGF19</h1>

<h2>Gene information</h2>
<details>
  <summary>Click to view the depmap.org information for FGF19</summary>
  <iframe src="https://depmap.org/portal/gene/FGF19?tab=about" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap overview</h2>
<details>
  <summary>Click to view the depmap.org summary for FGF19</summary>
  <iframe src="https://depmap.org/portal/gene/FGF19?tab=overview" style="border:none;width:100%;height:800px"></iframe>
</details>

<h2>Depmap expression</h2>
<details>
  <summary>Click to view the depmap.org expression data for FGF19</summary>
  <iframe src="https://depmap.org/portal/gene/FGF19?tab=characterization" style="border:none;width:100%;height:800px"></iframe>
</details>



<h2>Reactome Pathway diagram</h2>
PI5P, PP2A and IER3 Regulate PI3K/AKT Signaling
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
        diagram.loadDiagram("R-HSA-6811558");

        //Adding different listeners

        diagram.onDiagramLoaded(function (loaded) {
            console.info("Loaded ", loaded);
            diagram.flagItems("BAD");
	    diagram.flagItems("Q92934");
            if (loaded == "R-HSA-6811558") diagram.selectItem("R-HSA-6811558");
        });

     }
</script>



