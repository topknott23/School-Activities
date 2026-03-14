import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<Plant> plants = new ArrayList<>();
        List<Plant> deadPlants = new ArrayList<>();
        Scanner sc = new Scanner(System.in);
        System.out.print("Game Mode: ");
        String mode = sc.nextLine();

        String input;
        do {
            System.out.print("Add a plant: ");
            input = sc.nextLine();
            switch (input) {
                case "DONE":
                    break;
                case "Wall Nut":
                    plants.add(new Plant.WallNut());
                    break;
                case "Sun-shroom":
                    plants.add(new Mushroom.SunShroom(mode.equals("Night") || mode.equals("Fog")));
                    break;
              case "Puff-shroom":
                  plants.add(new Mushroom.PuffShroom(mode.equals("Night") || mode.equals("Fog")));
                  break;
              case "Doom-shroom":
                  plants.add(new Mushroom.DoomShroom(mode.equals("Night") || mode.equals("Fog")));
                  break;
              case "Sunflower":
                    plants.add(new Plant.Sunflower());
                  break;
                case "Peashooter":
                    plants.add(new Plant.Peashooter());
                    break;
                case "Squash":
                    plants.add(new Plant.Squash());
                    break;
                case "Jalapeno":
                    plants.add(new Plant.Jalapeno());
                    break;
                case "Twin Sunflower":
                    for(int i = 0; i < plants.size(); i++){
                        if(plants.get(i) instanceof Plant.Sunflower){
                            plants.set(i, new Plant.TwinSunflower());
                            break;
                        }
                        }
                    break;
                case "Lily Pad":
                    plants.add(new Plant.LilyPad());
                    break;
                case "Cattail":
                    for(int i = 0; i < plants.size(); i++){
                        if(plants.get(i) instanceof Plant.LilyPad){
                            plants.set(i, new Plant.Cattail());
                            break;
                            
                        }
                    }
                    break;
                case "Coffee Bean":
                    Plant.CoffeeBean coffeeBean = new Plant.CoffeeBean();
                    for(Plant p : plants){
                        if(p instanceof Mushroom m && !m.isAwake()){
                            m.awaken(coffeeBean);
                            break;
                        }
                    }
                    break;
                default:
                    System.out.println(input + " is not a plant");
            }
        } while (!input.equals("DONE"));

        do {
            System.out.print("Do something: ");
            input = sc.nextLine();
            switch (input) {
                case "DONE":
                    break;
                case "Produce Sun":
                    int totalSun = 0;
                    int sunCount = 0;
                    for(Plant p : plants){
                        if(p instanceof SunProducer sp){
                            totalSun += sp.produce_sun();
                            sunCount++;
                        }
                    }
                    System.out.println(sunCount > 0 ? sunCount + " sun producers gather " + totalSun + " suns" : "You have no sun producers");
                    break;
                case "Attack":
                    int dps = 0;
                    int attackCount = 0;
                    for(Plant p : plants){
                        if(p.isAlive() && p instanceof Attacker attacker){
                            int dmg = attacker.attack();
                            dps += dmg;
                            attackCount++;
                            if(p instanceof InstantKiller && dmg > 0) p.hp = 0;
                        }
                    }
                    
                    for(Plant p : plants){
                        if(!p.isAlive()&& !deadPlants.contains(p)) deadPlants.add(p);
                    }
                    
                    System.out.println(attackCount > 0 ? attackCount + " attackers dealing " + dps + " damage" : "You have no attackers");
                    break;
                    
                case "Attacker Status":
                    boolean hasAttacker = false;
                    for(Plant p : plants){
                        if(p.isAlive() && p instanceof Attacker a){
                            hasAttacker = true;
                            String str = p.getName() + " " + switch(a.rangeType()){
                            
                                case 0 -> "can attack on a single line";
                                case 1 -> "can attack only when enemy is nearby";
                                case 2 -> "can attack any enemies from anywhere";
                                case 3 -> "can attack using area-of-effect";
                                default -> "";
                            };
                            // if(p instanceof Mushroom m && !m.isAwake()) str += " (currently asleep)";
                            
                            System.out.println(str);
                            
                        }
                        
                    }
                    if(!hasAttacker){
                        System.out.println("You have no attackers");
                        break;
                    }
                    break;
                case "Instant Kill Status":
                    boolean hasInstant = false;
                    for(Plant p : plants){
                        if(p.isAlive() && p instanceof InstantKiller ik){
                            hasInstant = true;
                            String str = p.getName() + " ";
                            
                          str+= ik.killType() == 1 ? "can kill instantly" : "can kill on contact";
                            // if(p instanceof Mushroom m && !m.isAwake()){
                            //     str += " (currently asleep)";
                                
                            // }
                            System.out.println(str);
                            
                        }
                    }
                    if(!hasInstant) System.out.println("You have no plants which can kill instantly");
                    break;
                    case "Sort by HP":
                        
                plants.sort(Comparator.comparingInt(Plant::getHp).reversed().thenComparing(Plant::getName));
                plants.forEach(System.out::println);
                break;
                
                case "Sort by Name":
                    plants.sort(Comparator.comparing(Plant::getName));
                plants.forEach(System.out::println);
                break;
                case "Sort by Sun Cost":
                    plants.sort(Comparator.comparingInt(Plant::getCost).reversed().thenComparing(Plant::getName));
                    plants.forEach(System.out::println);
                    break;
                    
                default:
                    System.out.println("Unknown action: " + input);
            }
        } while (!input.equals("DONE"));
    }
}