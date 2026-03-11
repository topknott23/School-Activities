package NumberCounter;
import javax.swing.*;

public class NumberCounter extends JFrame{

    private JPanel contentPane;
    private JButton decreaseButton;
    private JButton increaseButton;
    private JLabel number;

       int total = 0;

    public NumberCounter(){

        setContentPane(contentPane);

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        pack();
        setVisible(true);

        number.setText("0");


        increaseButton.addActionListener(e -> {
         total++;
            number.setText(String.valueOf(total));

        });

        decreaseButton.addActionListener(e -> {
            total--;
            number.setText(String.valueOf(total));

        });

    }

    public static void main(String[] args){
        new NumberCounter();
    }
}

