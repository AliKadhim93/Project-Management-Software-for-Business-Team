#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

// Create a PWM object for PCA9685
Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver();

// Servo min and max pulse length
#define SERVOMIN 150  // Min pulse length
#define SERVOMAX 600  // Max pulse length

// Servo channels on the PCA9685
#define TOP_LEFT_EYELID 0
#define BOTTOM_LEFT_EYELID 1
#define TOP_RIGHT_EYELID 2
#define BOTTOM_RIGHT_EYELID 3
#define YARM 4
#define XARM 5

void setup() {
  pwm.begin();
  pwm.setPWMFreq(60);  // Set frequency to 60 Hz

  Serial.begin(9600);

  open_eye();
  eye_ball_centert();
  delay(2000);
}

void loop() {
  // Smooth eyeball movement left, right, and center
  smoothEyeMovement(XARM, 90, 50);  // Center to left
  delay(680);

  smoothEyeMovement(XARM, 50, 130);  // Left to right
  delay(680);

  smoothEyeMovement(XARM, 130, 90);  // Right to center
  delay(450);

  synchronous_close();
  eye_ball_centert();
  delay(450);

  look_up();
  delay(400);

  look_down();
  delay(400);

  eye_ball_centert();
  delay(300);

  random_close();
  delay(450);

  look_up();
  delay(400);

  look_down();
  delay(400);

  random_movement();
  delay(400);

  eye_ball_centert();
  delay(300);
}

// Function for smooth eyeball movement
void smoothEyeMovement(int channel, int startPosition, int endPosition) {
  int step = (startPosition < endPosition) ? 1 : -1;
  for (int pos = startPosition; pos != endPosition; pos += step) {
    moveServo(channel, pos);
    delay(15);  // Adjust for speed of movement
  }
  moveServo(channel, endPosition);  // Ensure it reaches the final position
}

void random_movement() {
  moveServo(XARM, 60);
  delay(random(250, 340));
  moveServo(YARM, 80);
  delay(random(250, 340));
  moveServo(XARM, 120);
  delay(random(250, 340));
  moveServo(YARM, 140);
  moveServo(XARM, 60);
  delay(random(250, 340));
  moveServo(YARM, 80);
  delay(random(250, 340));
  moveServo(XARM, 120);
  delay(random(250, 340));
  moveServo(YARM, 140);
  eye_ball_centert();
  delay(300);
  synchronous_close();
  random_close();
}

void random_close() {
  close_eye();
  delay(random(220, 880));
  open_eye();
  delay(random(220, 880));
}

void synchronous_close() {
  close_eye();
  delay(420);
  open_eye();
  delay(222);
}

void eye_ball_left() {
  moveServo(XARM, 50);
}

void eye_ball_right() {
  moveServo(XARM, 130);
}

void eye_ball_centert() {
  moveServo(XARM, 90);
  moveServo(YARM, 90);
}

void look_up() {
  moveServo(YARM, 132);
}

void look_down() {
  moveServo(YARM, 45);
}

void close_eye() {
  moveServo(TOP_LEFT_EYELID, 2);
  moveServo(BOTTOM_LEFT_EYELID, 120);
  moveServo(TOP_RIGHT_EYELID, 46);
  moveServo(BOTTOM_RIGHT_EYELID, 55);
}

void open_eye() {
  moveServo(TOP_LEFT_EYELID, 55);
  moveServo(BOTTOM_LEFT_EYELID, 36);
  moveServo(TOP_RIGHT_EYELID, 2);
  moveServo(BOTTOM_RIGHT_EYELID, 160);
}

// Function to control a servo on a specific PCA9685 channel
void moveServo(int channel, int position) {
  int pulselen = map(position, 0, 180, SERVOMIN, SERVOMAX);
  pwm.setPWM(channel, 0, pulselen);
}
