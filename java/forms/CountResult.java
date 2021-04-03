package forms;

public class CountResult {
    private Double a;
    private Double b;
    private Double c;
    private Double d;
    private Double result;

    public CountResult(double a, double b, double c, double d, double result) {
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = d;
        this.result = result;
    }

    public Double getA() {
        return a;
    }

    public Double getB() {
        return b;
    }

    public Double getC() {
        return c;
    }

    public Double getD() {
        return d;
    }

    public Double getResult() {
        return result;
    }
}
