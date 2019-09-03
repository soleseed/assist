package hansuo.trainArrival.websocket;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.LongAdder;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.interceptor.WebSecurityConfig;

/**
 * 虽然@Component默认是单例模式的，但springboot还是会为每个websocket连接初始化一个bean，所以可以用一个静态set保存起来。
 * 
 * @author Administrator
 *
 */
@ServerEndpoint(value = "/websocket", configurator = HttpSessionConfigurator.class)
@Component
public class WebSocket {

	private static final Log LOG = LogFactory.getLog(WebSocket.class);

	// 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static final LongAdder con = new LongAdder();

	public static final ConcurrentHashMap<WebUser, WebSocket> websocketMap = new ConcurrentHashMap<WebUser, WebSocket>();

	// 与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;

	private WebUser user;

	/**
	 * 连接建立成功调用的方法
	 */
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		this.session = session;
		user = getUser(config);
		websocketMap.put(user, this);
		// webSocketSet.add(this); // 加入set中
		con.increment(); // 在线数加1
		LOG.info("新用户[" + user.getUserName() + "],角色[" + user.getPostName() + "]加入！当前在线人数为" + con.intValue());
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose(Session session) {
		// System.out.println(session.getUserProperties());
//		WebUser user = getUser(config);
		Collection<WebSocket> sockets = websocketMap.values();
		if (sockets.contains(this)) {
			sockets.remove(this);
		}
		con.decrement(); // 在线数减1
		LOG.info("用户[" + user.getUserName() + "],角色[" + user.getPostName() + "]连接关闭！当前在线人数为" + con.intValue());
	}

	/**
	 * 收到客户端消息后调用的方法
	 *
	 * @param message 客户端发送过来的消息
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("来自客户端的消息:" + message);
		// 群发消息
//		for (WebSocket item : webSocketSet) {
//			try {
//				item.sendMessage(message);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
	}

	/**
	 * 发生错误时调用
	 * 
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		// System.out.println("发生错误");
		// error.printStackTrace();
	}

	// 群发自定义消息
	public static void sendInfo(String message) throws IOException {
		for (Map.Entry<WebUser, WebSocket> entry : websocketMap.entrySet()) {
			try {
				// WebUser user = entry.getKey();
				WebSocket webSocket = entry.getValue();
				webSocket.sendMessage(message);
			} catch (IOException e) {
				continue;
			}
		}
	}

	// 发给指定用户
	public static void sendInfo(WebUser user, String message) throws IOException {
		for (Map.Entry<WebUser, WebSocket> entry : websocketMap.entrySet()) {
			try {
				WebSocket webSocket = entry.getValue();
				if (user == entry.getKey()) {
					webSocket.sendMessage(message);
					LOG.info("给用户[" + user.getUserName() + "],角色[" + user.getPostName() + "]发送信息" + message);
				}
			} catch (IOException e) {
				continue;
			}
		}
	}

	// 发给指定用户组
	public static void sendInfo(List<WebUser> users, String message) throws IOException {
		for (Map.Entry<WebUser, WebSocket> entry : websocketMap.entrySet()) {
			try {
				WebSocket webSocket = entry.getValue();
				if (users.contains(entry.getKey())) {
					webSocket.sendMessage(message);
					LOG.info("给用户[" + entry.getKey().getUserName() + "],角色[" + entry.getKey().getPostName() + "]发送信息"
							+ message);
				}
			} catch (IOException e) {
				continue;
			}
		}
	}

	/**
	 * 
	 * @param postIds 需要发送的用户岗位
	 * @param deptId  发送用户所属场的参数
	 * @param message
	 * @throws IOException
	 */
	public static void sendInfoByPost(List<Integer> postIds, Integer deptId, String message) throws IOException {
		for (Map.Entry<WebUser, WebSocket> entry : websocketMap.entrySet()) {
			try {
				WebSocket webSocket = entry.getValue();
				WebUser user = entry.getKey();
				if (deptId == null) {
					if (postIds.contains(user.getPostId())) {
						webSocket.sendMessage(message);
						LOG.info("给用户[" + user.getUserName() + "],角色[" + user.getPostName() + "]发送信息" + message);
					}
				} else {
					if (postIds.contains(user.getPostId()) && user.getDeptId() == deptId) {
						webSocket.sendMessage(message);
						LOG.info("给用户[" + user.getUserName() + "],角色[" + user.getPostName() + "]发送信息" + message);
					}
				}
			} catch (IOException e) {
				continue;
			}
		}
	}

	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
	}

	private WebUser getUser(EndpointConfig config) {
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		WebUser user = (WebUser) httpSession.getAttribute(WebSecurityConfig.SESSION_KEY);
		return user;
	}
}
