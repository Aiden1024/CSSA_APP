import 'package:intl/intl.dart';

import '../../models/post.dart';
import '../../models/user_profile.dart';

class TestObj {
  static String mainText = '''
    龙王巡海，风卷云来。
  ===============================
  「整座璃月港,也只有北斗敢真赢凝光的钱。」——飞云商会会长在一次家宴中的醉后真言。
  
  几乎每个璃月人都知道「南十字」船队大姐头北斗的威名，茶余饭后也爱聊起她。
  码头边，船员们绘声绘色地描述北斗斩杀冥海巨兽「海山」的场面。
  饭局上，商人们争相讨论北斗主导的一次次违律商运与其招致的天价罚款。
  但对「南十字」的船员们来说，最值得一谈的，还是北斗从凝光手里赢到了摩拉。
  具体金额不详，比试次数也无从考证，但船员们都看见北斗醉醺醺地回到船上。瞧她那模样，绝对是已经痛饮了一场。
  「下次得让那女人倾家荡产！」北斗说着，躺倒在甲板上。
  如此豪言壮语…船员们就权当它是大姐头酒后的玩笑话了。
  
  厌离浮世泡影，欣求净土常道。
===============================
「薙除俗世芜杂的执妄，只为扭转生灭轮回的羁缠。不为人所真正理解，亦不屑为人所看破…将军殿下她，实在是一个很矛盾的人。」——狐斋宫

稻妻全土毋容置疑的统治者。
担负着「御建鸣神主尊大御所」之威名，许稻妻民众以亘古不变之「永恒」。
以无情的稻光击碎爱执，以孤独的心铸就净土…
在这漫长岁月中，永恒之道黑暗而遥远，然而，将军殿下从不犹疑——
不变的恒常，仅在斫去杂音之后才显现其「寂」之本质。
  ''';

  static UserProfile testUp = UserProfile(username: "username", formalName: "formalName", bio: "bio", post: [], departments: [], pic: Future<String>.value(""));

  static String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  static Post testPost = Post(uid: "g1SFLa5zPafSZRGvzJWiRWIsNyd2", title: "title", mainText: mainText, likes: 26, date: formattedDate, pic: "pic", subtitle: "subtitle");


}