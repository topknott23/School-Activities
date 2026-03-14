package SimpleCalculator;

import javax.swing.*;

public class SimpleCalculator extends JFrame {

    private JTextField tf1;
    private JComboBox comboBox1;
    private JTextField tf2;
    private JButton computeResultButton;
    private JLabel result;
    private JPanel contentPane;

    public SimpleCalculator(){
        setContentPane(contentPane);

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        pack();
        setVisible(true);

        computeResultButton.addActionListener(e -> {
        String s1 = tf1.getText();
        String s2 = tf2.getText();

        int num1 = Integer.parseInt(s1);
        int num2 = Integer.parseInt(s2);

        String op = (String) comboBox1.getSelectedItem();
        int res = 0;

        switch(op){
            case "+" :
                res = num1 + num2;
                break;
            case "-" :
                res = num1 - num2;
                break;
            case "*" :
                res = num1 * num2;
                break;
            case "/" :
                try {
                    res = num1 / num2;
                }catch (ArithmeticException ee){
                    result.setText("Error: Cannot divide zero");
                    return;
                }
            break;

        }
        result.setText(String.valueOf(res));
        });
    }

    public static void main(String[] args){
        new SimpleCalculator();
    }
}

