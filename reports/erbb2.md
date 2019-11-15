<h1>ERBB2</h1>
<h2>Reactome Pathway diagram</h2>
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
        diagram.loadDiagram("R-HSA-111447");

        //Adding different listeners

        diagram.onDiagramLoaded(function (loaded) {
            console.info("Loaded ", loaded);
            diagram.flagItems("FYN");
            if (loaded == "R-HSA-111447") diagram.selectItem("R-HSA-111447");
        });

     }
</script>


<h2>Depmap overview</h2>
<details>
  <summary>Click to view the depmap.org summary for ERBB2</summary>

  <iframe src="https://depmap.org/portal/gene/ERBB2?tab=overview" style="border:none;width:100%;height:800px"></iframe>
</details>





{% include js.html %}
