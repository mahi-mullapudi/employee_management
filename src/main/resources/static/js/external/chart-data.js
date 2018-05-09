var randomScalingFactor = function () {
    return Math.round(Math.random() * 1000)
};

var lineChartData = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(128,130,228,0.6)",
            strokeColor: "rgba(128,130,228,1)",
            pointColor: "rgba(128,130,228,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(128,130,228,1)",
            data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
        }
    ]

}

var barChartData = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
        },
        {
            fillColor: "rgba(128,130,228, 0.6)",
            strokeColor: "rgba(128,130,228, 1)",
            highlightFill: "rgba(128,130,228, 0.75)",
            highlightStroke: "rgba(128,130,228, 1)",
            data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
        }
    ]

}

var pieData = [
    {
        value: 300,
        color: "#8082e4",
        highlight: "#7376df",
        label: "Value 1"
    },
    {
        value: 50,
        color: "#a0a0a0",
        highlight: "#999999",
        label: "Value 2"
    },
    {
        value: 100,
        color: "#dfdfdf",
        highlight: "#cccccc",
        label: "Value 3"
    },
    {
        value: 120,
        color: "#f7f7f7",
        highlight: "#eeeeee",
        label: "Value 4"
    }

];

var doughnutData = [
    {
        value: 300,
        color: "#8082e4",
        highlight: "#7376df",
        label: "Value 1"
    },
    {
        value: 50,
        color: "#a0a0a0",
        highlight: "#999999",
        label: "Value 2"
    },
    {
        value: 100,
        color: "#dfdfdf",
        highlight: "#cccccc",
        label: "Value 3"
    },
    {
        value: 120,
        color: "#f7f7f7",
        highlight: "#eeeeee",
        label: "Value 4"
    }
];

var radarData = {
    labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 90, 81, 56, 55, 40]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(128,130,228, 0.6)",
            strokeColor: "rgba(128,130,228, 1)",
            pointColor: "rgba(128,130,228, 1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(128,130,228, 1)",
            data: [28, 48, 40, 19, 96, 27, 100]
        }
    ]
};
var polarData = [
    {
        value: 300,
        color: "#8082e4",
        highlight: "#7376df",
        label: "Value 1"
    },
    {
        value: 140,
        color: "#a0a0a0",
        highlight: "#999999",
        label: "Value 2"
    },
    {
        value: 220,
        color: "#dfdfdf",
        highlight: "#cccccc",
        label: "Value 3"
    },
    {
        value: 250,
        color: "#f7f7f7",
        highlight: "#eeeeee",
        label: "Value 4"
    }

];

