package com.example.clickbata;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.text.method.HideReturnsTransformationMethod;
import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;

public class SignIn extends AppCompatActivity {
    TextView register,forgotpass;
    EditText email,password;
    FloatingActionButton signin;
    ProgressDialog progressDialog;
    FirebaseAuth LFirebaseAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_in);

        LFirebaseAuth = FirebaseAuth.getInstance();
        if (LFirebaseAuth.getCurrentUser()!= null){
            finish();
            startActivity(new Intent(SignIn.this, LiveFeed.class));
        }

        register=findViewById(R.id.lnoaccount);
        forgotpass=findViewById(R.id.lforgot);
        email=findViewById(R.id.lemail);
        password=findViewById(R.id.lpassword);
        signin=findViewById(R.id.lsubmit);

        progressDialog=new ProgressDialog(this);

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
                startActivity(new Intent(SignIn.this, Register.class));
            }
        });

        signin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String semail = email.getText().toString();
                String spwd = password.getText().toString();

                if (semail.isEmpty()) {
                    email.setError("Please enter email id");
                    email.requestFocus();
                }
                else if (spwd.isEmpty()) {
                    password.setError("Please enter Password");
                    password.requestFocus();
                }
                else {
                    progressDialog.setMessage("Authenticating...");
                    progressDialog.show();

                    LFirebaseAuth.signInWithEmailAndPassword(semail,spwd).addOnCompleteListener(SignIn.this, new OnCompleteListener<AuthResult>() {
                        @Override
                        public void onComplete(@NonNull Task<AuthResult> task) {
                            progressDialog.dismiss();

                            if (!task.isSuccessful()) {
                                Toast.makeText(SignIn.this, "Incorrect Username or Password", Toast.LENGTH_LONG).show();
                            } else {
                                Toast.makeText(SignIn.this, "Signed In Successfully", Toast.LENGTH_LONG).show();
                                finish();
                                startActivity(new Intent(SignIn.this, LiveFeed.class));
                            }
                        }
                    });
                }
            }
        });
    }

    public void ForgotPassword(View view) {
        progressDialog=new ProgressDialog(this);

        AlertDialog.Builder build=new AlertDialog.Builder(SignIn.this);
        build.setTitle("Send Verification Email");

        final EditText checkemail=new EditText(SignIn.this);
        email.setHint("Enter your registered email id.");
        email.setInputType(InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS);

        build.setView(checkemail);
        build.setPositiveButton("Send Mail",null);
        build.setNegativeButton("Cancel",null);

        final AlertDialog dialog=build.create();
        dialog.show();

        dialog.getButton(DialogInterface.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                progressDialog.setMessage("Sending Password Reset Mail...");
                progressDialog.show();

                String emailtext=checkemail.getText().toString().trim();
                if(emailtext.isEmpty()){
                    checkemail.setError("Email Id Required");
                    progressDialog.dismiss();
                    checkemail.requestFocus();
                }
                else{
                    LFirebaseAuth.sendPasswordResetEmail(emailtext).addOnCompleteListener(new OnCompleteListener<Void>() {
                        @Override
                        public void onComplete(@NonNull Task<Void> task) {
                            if(task.isSuccessful()){
                                progressDialog.dismiss();
                                dialog.dismiss();
                                Toast.makeText(SignIn.this, "Reset Password Mail Sent Successfully, Please Check Your Inbox", Toast.LENGTH_LONG).show();
                            }
                            else{
                                progressDialog.dismiss();
                                checkemail.setError("Incorrect Email Id");
                                checkemail.requestFocus();
                            }
                        }
                    });
                }
            }
        });
    }
}
