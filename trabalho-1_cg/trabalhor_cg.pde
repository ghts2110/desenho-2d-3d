// passaro
double[] dp = new double[1001]; 
void fib(){
  dp[0] = 0;
  dp[1] = 1;
  for(int i = 2; i != 1000; i++){
    dp[i] = dp[i-1] + dp[i-2];
  } 
}

//pessoa 
int[][] mat_pessoa = new int[23][2];
int d = 0;

// ceu
int r=75, g=135, b=175, time_luz = 0, fase_lua = -1;
float[] mat_sol = new float[2];
float[] mat_lua = new float[2];

int time_passaro = 2;
float centerX, centerY; // Centro do círculo
float radius = 250;    // Raio do círculo
float angle = 0;       // Ângulo inicial
float speed = 0.02;    // Velocidade de rotação
boolean validate_volta = true;
float rotatingX_vagalumi = 200; // Posição inicial x do ponto rotacionado
float rotatingY_vagalumi = 200; // Posição inicial y do ponto rotacionado
float centerX_vagalumi = 290; // Coordenada x do centro da tela
float centerY_vagalumi = 280; // Coordenada y do centro da tela
float angle_vagalumi = 1; // Ângulo de rotação inicial em radianos
float rotatedX_vagalumi, rotatedY_vagalumi;

//mar
int time = 0, t = 0, nivel = 600;
boolean val1 = true, val2 = true;

//casa
int time_janela = 0;
boolean open = true;
int time_chamine = 0, cont_chamine = 0;

// thread
Thread tm = new Thread(new Mar());
Thread ts = new Thread(new Sol());
Thread tl = new Thread(new Lua());
Thread tfc = new Thread(new Fumaca_chamine());
Thread tj = new Thread(new Janela());
Thread tmp = new Thread(new Movimento_pessoa());
Thread tv = new Thread(new Vagalumi());

void setup(){
  size(600, 600);
  centerX = width / 2;
  centerY = height / 2;
  fib();
  pss();
  ls();
  
  noLoop();
  noSmooth();
  
  ts.start(); 
  tm.start(); 
  tl.start();
  tfc.start();
  tj.start();
  tmp.start();
  tv.start();
}

void draw() {
  background(r, g, b);

  //chao
  grama();
  areia();
  mar(nivel, t);  
  arvore();

  //ceu
  if(mat_sol[0] <= 660){
    sol();
  }
  if(mat_lua[0] <= 660){
    if(mat_lua[0] < 700){
      vagalumi();
    }
    lua(fase_lua);
  }
  
  
  //casa
  parede_da_casa();
  chamine(cont_chamine);
  telhado();
  porta();  
  janela(open);
  macaneta();
  
  //pessoa
  if(mat_sol[0] < 600 && mat_sol[0] > 0){
    corpo(d);
    cabeca();
    chapeu(d);
  }
  
    passaro(dp);
}
