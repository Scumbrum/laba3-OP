public class Counter {
    private String taskNumber;

    public Counter(String taskNumber) {
        this.taskNumber = taskNumber;
    }

    public double count(Double a, Double b, Double c, Double d){
        double result;
        switch (this.taskNumber){
            case "7":
                result = Math.pow(4*Math.cosh(Math.sqrt(a/b))+3*Math.acos(c),d);
                break;
            case "8":
                result = 5*a/Math.sin(a)+Math.sqrt(Math.tanh(Math.abs(b)*c)/Math.log(d));
                break;
            case "9":
                result = (Math.sin(Math.abs(a))+Math.cos(Math.sqrt(b)))/(2*Math.tan(c)+Math.pow(Math.E,d));
                break;
            default:
                throw new IllegalArgumentException("Bad task number");
        }
        return result;
    }
}
