pragma circom 2.0.0;

/This circuit template checks that c is the multiplication of a and b./  

template Multiplier2 () {  
   signal input A_start;
   signal input B_start;

   signal X_mid;
   signal Y_mid;

   signal output Q_end;

   component and->gate=AND();
   component or->gate=OR();
   component not->gate=NOT();

   and->gate.a <== A_start ;
   and->gate.b <== B_start ;
   X_mid <== and->gate.out ;

   not->gate.in <== B_start ;
   Y_mid <== not->gate.out;

   or->gate.a <== X_mid;
   or->gate.b <== Y_mid;
   Q_end_end <== or->gate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
