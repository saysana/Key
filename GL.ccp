#include <gl\GL.h>
#include <stdio.h>
#include<gl\glut.h>
#include<gl\GLU.h>

#define ESCAPE 27

GLfloat xt=1.0,yt=1.0;
GLfloat window;
float angle = 0;

void init(void)
{
   glClearColor(1.0,1.0,1.0,0.0);
   glColor3f(0.0,0.0,1.0);
   glPointSize(4.0);
   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();
   gluOrtho2D(-5.0,5.0,-5.0,5.0);
}
void Keyboard (unsigned char key,int x,int y)
{
  switch (key)
	{
	case 'r':
		glColor3f(1.0,0.0,0.0);
		glutPostRedisplay();
		break;
	case 'g':
		glColor3f(0.0,1.0,0.0);
		glutPostRedisplay();
		break;
	case 'b':
		glColor3f(0.0,0.0,1.0);
		glutPostRedisplay();
		break;
	case 'e':
		exit(0);
		break;
	default:
		break;
	}
void myDisplay(void)
{
glClear(GL_COLOR_BUFFER_BIT);
glPushMatrix();
	  glTranslatef(xt,yt,0.0);
	  glRotatef(angle,0.0,angle,0.0);
	  glutWireIcosahedron();
glPopMatrix();
glutSwapBuffers();
glFlush();
}
void animation(void)
{
		angle = angle + 0.1;
		glutPostRedisplay(); 
}

void keyboardAssign (GLubyte key, GLint x, GLint y)
{
	switch ( key )
	{
	case ESCAPE :
		printf(" escape press. exit. \n");
		glutDestroyWindow(window);
		
		break;
	case 'd':
			xt += 2.0;
			glutPostRedisplay();
			break;

	case 'a':
			xt -= 2.0;
			glutPostRedisplay();
			break;

	case 'w':
			yt += 2.0;
			glutPostRedisplay();
			break;

	case 's':
			yt -= 2.0;
			glutPostRedisplay();
			break;

	case 'e':
			xt += 2.0;
			yt += 2.0;
			glutPostRedisplay();
			break;

	case 'q':
			xt -= 3.0;
			yt += 3.0;
			glutPostRedisplay();
			break;
	case 'c':
			xt += 2.0;
			yt -= 2.0;
			glutPostRedisplay();
			break;

	case 'z':
			xt -= 2.0;
			yt -= 2.0;
			glutPostRedisplay();
			break;
	default:
	break;
	}
}





void main(int argc,char** argv)
{
  glutInit(&argc,argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
  glutInitWindowPosition(100,100);
  glutInitWindowSize(500,500);

  glutCreateWindow("Simple");

  init();
  glutDisplayFunc(myDisplay);
  glutIdleFunc(animation);
  glutKeyboardFunc(keyboardAssign);
  glutMainLoop();
}
