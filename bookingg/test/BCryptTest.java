import MD5.BCrypt;
import org.junit.Test;
import static org.junit.Assert.*;

public class BCryptTest {

    private static final int LOG_ROUNDS = 5; // Mức bảo mật 5

    @Test
    public void BT01() {
        String password = "TestPassword123";
        String salt = BCrypt.gensalt(LOG_ROUNDS);
        String hashedPassword = BCrypt.hashpw(password, salt);

        assertNotNull("Mật khẩu đã mã hóa không được null", hashedPassword);
        assertTrue("Mật khẩu không bắt đầu với mức log_rounds = 5", hashedPassword.startsWith("$2a$05$"));
        assertTrue("Mật khẩu đã mã hóa không khớp với bản gốc", BCrypt.checkpw(password, hashedPassword));
    }

    @Test
    public void BT02() {
        String password = "CorrectPassword";
        String wrongPassword = "WrongPassword";
        String salt = BCrypt.gensalt(LOG_ROUNDS);
        String hashedPassword = BCrypt.hashpw(password, salt);

        assertFalse("Mật khẩu sai không được khớp với mật khẩu đã mã hóa", BCrypt.checkpw(wrongPassword, hashedPassword));
    }

    @Test
    public void BT03() {
        String password = "SamePassword";

        String salt1 = BCrypt.gensalt(LOG_ROUNDS);
        String salt2 = BCrypt.gensalt(LOG_ROUNDS);

        String hash1 = BCrypt.hashpw(password, salt1);
        String hash2 = BCrypt.hashpw(password, salt2);

        assertNotEquals("BCrypt phải tạo ra hash khác nhau ngay cả với cùng một mật khẩu", hash1, hash2);
    }

    @Test
    public void BT04() {
        String password = "";
        String salt = BCrypt.gensalt(LOG_ROUNDS);
        String hashedPassword = BCrypt.hashpw(password, salt);

        assertNotNull("Mật khẩu rỗng vẫn phải được mã hóa", hashedPassword);
        assertTrue("O", BCrypt.checkpw(password, hashedPassword));
    }

    @Test(expected = NullPointerException.class)
    public void testBCryptWithNullPassword() {
        String salt = BCrypt.gensalt(LOG_ROUNDS);
        BCrypt.hashpw(null, salt); // BCrypt không hỗ trợ mật khẩu null, test này sẽ ném lỗi NullPointerException
    }

//    @Test
//    public void testBCryptPerformance() {
//        String password = "PerformanceTest123";
//        String salt = BCrypt.gensalt(LOG_ROUNDS);
//
//        long startTime = System.currentTimeMillis();
//        String hashedPassword = BCrypt.hashpw(password, salt);
//        long endTime = System.currentTimeMillis();
//
//        long duration = endTime - startTime;
//        System.out.println("Thời gian mã hóa BCrypt mức 5: " + duration + "ms");
//
//        assertTrue("Thời gian mã hóa không hợp lệ", duration > 0);
//        assertTrue("Mật khẩu đã mã hóa không khớp", BCrypt.checkpw(password, hashedPassword));
//    }
}
