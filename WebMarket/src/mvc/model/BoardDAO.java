package mvc.model;

//싱글톤
public class BoardDAO {
	//1. 자신 타입의 static 필드 선언
     private static BoardDAO instance;
     
    //2. default 생성자를 private로 선언
     private BoardDAO() {}
	
    //3. public 접근제어타입의 getInstance 메소드 선언, getInstance()로만 접근 
     public static BoardDAO getInstance() {
    	 if(instance == null) instance = new BoardDAO(); //1번에서 미리 선언하면 여기에서는 빼도 괜츈
		return instance;
	} 
     
     
}
