public abstract class Plant {
    public static final int INFINITE = Integer.MAX_VALUE;

    String name;
    int hp;
    int sun_cost;

    public Plant(String name, int sun_cost) {
        this.name = name;
        this.hp = 6;
        this.sun_cost = sun_cost;
    }

    public Plant(String name, int hp, int sun_cost) {
        this.name = name;
        this.hp = hp;
        this.sun_cost = sun_cost;
    }

    public boolean isAlive() {
        return hp > 0;
    }
    public String getName(){
        return name;
    }
    public int getHp(){
        return hp;
    }
    public int getCost(){
        return sun_cost;
    }
    
    public String die() {
    
        return "";
    }

    @Override
    public String toString() {
       return hp == INFINITE ? name + " (?) - cost: " + sun_cost : name + " (" + hp + ") - cost: " + sun_cost; 
           }

    // Add Plant subclasses here, and
    // Hint: You can also add Comparator inner classes here
    // WallNut and CoffeeBean given for free
    public static class WallNut extends Plant{
        public WallNut() {
            super("Wall Nut", 25, 50);
        }
    }

    public static class CoffeeBean extends Plant{
        public CoffeeBean() {
            super("Coffee Bean", INFINITE, 75);
        System.out.println("Coffee Bean dies");
        }
    }
    
    public static class Sunflower extends Plant implements SunProducer, Upgradable{
        public Sunflower(){
            super("Sunflower", 6, 50);
        }
        public int produce_sun(){
            System.out.println(name + " produces 25 suns");
            return 25;
        }
        
        public PlantUpgrade upgrade(){
            return new TwinSunflower();
        }
    }
    
    public static class TwinSunflower extends Plant implements SunProducer, PlantUpgrade{
        public TwinSunflower(){
            super("Twin Sunflower", 6, 250);
            
        }
        public int produce_sun(){
            System.out.println(name + " produces 50 suns");
            return 50;
        }
        public int concurrentSunCost(){
            return 50;
        }
    }
    
    public static class Peashooter extends Plant implements Attacker{
        public Peashooter(){
            super("Peashooter", 6, 100);
        }
        public int attack(){
            System.out.println(name + " attacks");
            return 1;
        }
        
        public int rangeType(){
            return 0;
        }
    }
    
    public static class Squash extends Plant implements Attacker, InstantKiller {
        public Squash(){
            super("Squash", INFINITE, 50);
        }
        public int attack(){
            System.out.println(name + " attacks");
            System.out.println(name + " dies while squashing zombies");
            return 3;
        }
        public int rangeType(){
            return 1;
        }
        public int killType(){
            return 0;
        }
    }
    
    public static class Jalapeno extends Plant implements Attacker, InstantKiller{
        public Jalapeno(){
            super("Jalapeno", INFINITE, 125);
        }
        public int attack(){
            System.out.println(name + " attacks");
            System.out.println(name + " dies while exploding");
            return 5;
        }
        public int rangeType(){
            return 0;
        }
        public int killType(){
            return 1;
        }
    }
    
    public static class LilyPad extends Plant implements Upgradable{
        public LilyPad(){
            super("Lily Pad", 6, 25);
        }
        public PlantUpgrade upgrade(){
            return new Cattail();
        }
    }
    
    public static class Cattail extends Plant implements Attacker, PlantUpgrade {
        public Cattail(){
            super("Cattail", 6, 225);
        }
        public int attack(){
            System.out.println(name + " attacks");
            
        return 1;                 
        }
        
        public int rangeType(){
            return 2;
        }
        public int concurrentSunCost(){
            return 25;
        }
    }
    
}