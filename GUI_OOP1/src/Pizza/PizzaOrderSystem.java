package Pizza;

import javax.swing.*;

public class PizzaOrderSystem extends JFrame{
    private JComboBox comboBox1;
    private JComboBox comboBox2;
    private JComboBox comboBox3;
    private JButton calculateTotalButton;
    private JLabel calculateTotal;
    private JPanel contentPane;

    public PizzaOrderSystem(){
        setContentPane(contentPane);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        pack();
        setVisible(true);

        calculateTotalButton.addActionListener(e -> {
            int total = 0;
            String choice = (String) comboBox1.getSelectedItem();

            switch (choice){
                case "Small":
                    total += 10;
                    break;
                case "Medium":
                    total += 15;
                    break;
                case "Large":
                    total += 20;
                    break;

            }


            String choice1 = (String) comboBox2.getSelectedItem();
            if(!choice1.equals("Select")) total += 2;

            String choice2 = (String) comboBox3.getSelectedItem();
            if(choice2.equals("Yes")) total += 3;

            calculateTotal.setText(total + "");
        });
    }

    public static void main(String[] args){
        new PizzaOrderSystem();

    }
}


