public class Thing {
    static volatile final private double MEH = 12.0;
    Map<String, String> mappers = null;
    ArrayList<Integer> listy = null;

    enum FreshJuiceSize{ SMALL, MEDIUM, LARGE }
    float asdf = 2;

    public static void main(String args[]) {
        FreshJuice juice = new FreshJuice();
        this.asdf += 5;

        try {
            throw Exception('s');
        } catch(Exception e) {
            if(e instanceof UncheckedException) {
                synchronized {
                    System.out.println("Size: " + juice.size);
                }
            }
        } finally {
            doThing();
        }
    }

    interface HoHum {
        int huh();
    }

    protected abstract class InnerThing implements HoHum {}

    private class OuterInnerThing extends InnerThing {
        public int huh() {
            meh: while(true) {
                assert(false);
                break;
                continue meh;
            }
            return 3;
        }
    }

    public Thing(String... asdf) {
        super();
        Function<Integer, Integer> l = (x) -> x + 1;
    }

    /**
     * Does a thing now
     *
     * @see #field
     * @see #Constructor(Type, Type...)
     * @see #Constructor(Type id, Type id...)
     * @see #method(Type, Type,...)
     * @see #method(Type id, Type, id...)
     * @see Class
     * @see Class#field
     * @see Class#Constructor(Type, Type...)
     * @see Class#Constructor(Type id, Type id)
     * @see Class#method(Type, Type,...)
     * @see Class#method(Type id, Type id,...)
     * @see package.Class
     * @see package.Class#field
     * @see package.Class#Constructor(Type, Type...)
     * @see package.Class#Constructor(Type id, Type id)
     * @see package.Class#method(Type, Type,...)
     * @see package.Class#method(Type id, Type, id)
     * @see package
     * @param ch        the character to be tested
     * @param observer  the image observer to be notified

     * @author ME
     * @return stuff "\nasdf"
     * @version 1.39, 02/28/97
     * @deprecated  As of JDK 1.1, replaced by
     *              {@link #setBounds(int,int,int,int)}
     * @since 1.2
     * @throws IOException  If an input or output
     *                      exception occurred
     */
    public synchronized int doThing() throws Exception {
        return 42;
    }
}
