package com.example.clickbata;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.text.method.HideReturnsTransformationMethod;
import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class Register extends AppCompatActivity {
    Button loginpage;
    FloatingActionButton submit;
    EditText username,email,password;
    ProgressDialog progressDialog;
    FirebaseAuth mFirebaseAuth;
    DatabaseReference databaseReference;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        mFirebaseAuth=FirebaseAuth.getInstance();

        if (mFirebaseAuth.getCurrentUser()!= null){
            finish();
            startActivity(new Intent(Register.this, LiveFeed.class));
        }

        progressDialog=new ProgressDialog(this);

        loginpage=findViewById(R.id.rlogin);
        submit=findViewById(R.id.rsubmit);
        username=findViewById(R.id.rusername);
        email=findViewById(R.id.remail);
        password=findViewById(R.id.rpassword);

        loginpage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
                startActivity(new Intent(Register.this,SignIn.class));
            }
        });

        databaseReference= FirebaseDatabase.getInstance().getReference();

        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String susername,semail,spass;
                susername=username.getText().toString().trim();
                semail=email.getText().toString().trim();
                spass=password.getText().toString().trim();

                if(susername.isEmpty()) {
                    username.setError("Please enter username");
                    username.requestFocus();
                }
                else if(semail.isEmpty()) {
                    email.setError("Please enter email id");
                    email.requestFocus();
                }

                else if(spass.isEmpty()) {
                    password.setError("Please enter password");
                    password.requestFocus();
                }
                else if(!(susername.isEmpty() && semail.isEmpty() && spass.isEmpty())){
                    progressDialog.setMessage("Registering User...");
                    progressDialog.show();

                    mFirebaseAuth.createUserWithEmailAndPassword(semail,spass).addOnCompleteListener(Register.this, new OnCompleteListener<AuthResult>() {
                        @Override
                        public void onComplete(@NonNull Task<AuthResult> task) {
                            progressDialog.dismiss();
                            if(!task.isSuccessful()){
                                Toast.makeText(Register.this,"Registration Unsuccessful, Required Fields are Empty",Toast.LENGTH_LONG).show();
                            }

                            else{

                                UserInformation userInformation=new UserInformation(susername,semail,spass);

                                FirebaseUser user=mFirebaseAuth.getCurrentUser();
                                databaseReference.child(user.getUid()).setValue(userInformation);

                                Toast.makeText(Register.this,"Registered Successfully",Toast.LENGTH_LONG).show();

                                finish();
                                startActivity(new Intent(Register.this,LiveFeed.class));
                            }
                        }
                    });
                }
                else{
                    Toast.makeText(Register.this,"Please Check Your Internet Connection",Toast.LENGTH_LONG).show();
                }
            }
        });

    }
}
