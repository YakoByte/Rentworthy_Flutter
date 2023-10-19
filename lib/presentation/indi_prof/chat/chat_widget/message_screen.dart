import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/color.dart';

import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_iconbutton.dart';
import '../../../../utils/common_components/common_listview.dart';
import '../../../../utils/common_components/common_popup.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/common_title_subtitle.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../home/categories/curve_wave.dart';
import '../../home/categories/home_search.dart';
import '../chat_screen_controller.dart';
import 'chat_item.dart';

class MessageScreen extends ConsumerStatefulWidget {
  String title, subtitle;

  MessageScreen({super.key, required this.title, required this.subtitle});

  @override
  ConsumerState createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(chatScreenControllerProvider);
    controller() => ref.read(chatScreenControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBar(
        leadingicon: true,
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.white,
        centerTitle: false,
        centerwidget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.02,
          ),
          child: TitleSubtitle(
            isColExpanded: false,
            isExpanded: false,
            onTap: () {},
            title: widget.title,
            subtitle: widget.subtitle,
            titleStyle: ptSansTextStyle(
                fontSize: w * 0.033,
                color: AppColors.black.withOpacity(0.6),
                fontWeight: FontWeight.w700),
            subtitleStyle: ptSansTextStyle(
                fontSize: h * 0.015,
                color: AppColors.black.withOpacity(0.6),
                fontWeight: FontWeight.w400),
          ),
        ),
        suffixicon: Container(
          width: w * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CommonIconButton(
              //     containerwidth: h * 0.045,
              //     containerheight: h * 0.045,
              //     backgroundColor: AppColors.white,
              //     shape: const RoundedRectangleBorder(),
              //     centericon: Icon(Icons.call,
              //         color: AppColors.black.withOpacity(0.6), size: h * 0.025),
              //     onPressed: () {}),
              CommonIconButton(
                  containerwidth: h * 0.045,
                  containerheight: h * 0.045,
                  backgroundColor: AppColors.white,
                  shape: const RoundedRectangleBorder(),
                  centericon: Icon(
                    Icons.more_vert,
                    color: AppColors.black.withOpacity(0.6),
                    size: h * 0.025,
                  ),
                  onPressed: () {
                    CommonPopup(
                        position: RelativeRect.fromLTRB(
                            w * 0.5, 0, w * 0.02, h * 0.8),
                        items: controller().popupitemList);
                  }),
            ],
          ),
        ),
        leadicon: Container(
          height: h * 0.1,
          width: h * 0.08,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  AppImg.homelist,
                  height: h * 0.05,
                  width: h * 0.05,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: w * 0.01,
                child: Container(
                  height: h * 0.04,
                  width: h * 0.04,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      AppImg.homelist,
                      height: h * 0.04,
                      width: h * 0.04,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Container(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
          child: Column(
            children: <Widget>[
              Expanded(child: buildGroupMessageList()),
              _buildList(),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildGroupMessageList() {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(chatScreenControllerProvider);
    controller() => ref.read(chatScreenControllerProvider.notifier);

    return CommonListView(
        controller: controller().scrollController,
        itemCount: controller().getmsgList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        width: w,
        height: h * 0.9,
        itemBuilder: (context, index) {
          return ChatItem(
            index: index,
            item: controller().getmsgList,
            loginstudid: '1',
          );
        });
  }

  Widget _buildList() {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(chatScreenControllerProvider);
    controller() => ref.read(chatScreenControllerProvider.notifier);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: AppColors.transparent,
            ),
            child: Column(
              children: [
                controller().getisShow == false
                    ? GestureDetector(
                        onTap: () {
                          controller().openchat(val: true);
                        },
                        child: Container(
                          height: h * 0.05,
                          width: w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Divider(
                            color: AppColors.black.withOpacity(0.6),
                            endIndent: w * 0.45,
                            indent: w * 0.45,
                            thickness: 3,
                          ),
                        )
                            .animate(
                                controller:
                                    controller().closeanimationController,
                                autoPlay: false)
                            .fadeIn(duration: 400.ms)
                            .then(delay: 400.ms)
                            .slideY(
                                begin: -1,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 800.ms),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller().openchat(val: false);
                        },
                        child: Container(
                          height: h * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: h * 0.05,
                                width: w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: h * 0.03,
                                  color: AppColors.black.withOpacity(0.6),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.07),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(AppImg.chat,
                                            height: h * 0.035,
                                            width: h * 0.035),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                foreground: Paint()
                                                  ..shader =
                                                      const LinearGradient(
                                                    colors: <Color>[
                                                      AppColors.colorPrimary,
                                                      AppColors.colorSecondary
                                                    ],
                                                  ).createShader(
                                                          const Rect.fromLTRB(
                                                              30, 10, 100, 20)),
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w700),
                                            text: AppText.chats)
                                      ],
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary,
                                        ],
                                      ).createShader(
                                          Rect.fromLTRB(30, 10, 100, 20));
                                    },
                                    child: Divider(
                                      height: h * 0.01,
                                      thickness: h * 0.0025,
                                      endIndent: w * 0.6,
                                    ),
                                  ),
                                  CommonListView(
                                      itemCount:
                                          controller().getquestionList.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.02,
                                          vertical: h * 0.01),
                                      width: w,
                                      height: h * 0.3,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: h * 0.01),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: AppColors.white,
                                              border: Border.all(
                                                  color: AppColors.black
                                                      .withOpacity(0.1),
                                                  width: 1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(w * 0.02),
                                              child: CommonText(
                                                  style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      fontSize: h * 0.018,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  text: controller()
                                                      .getquestionList[index]),
                                            ),
                                          ),
                                        );
                                      }),
                                ],
                              )
                            ],
                          ),
                        )
                            .animate(
                                controller:
                                    controller().divideranimationController,
                                autoPlay: false)
                            .fadeIn(duration: 600.ms)
                            .then(delay: 600.ms)
                            .slideY(
                                begin: 0.9,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 800.ms),
                      ),
                Divider(
                  height: h * 0.01,
                  thickness: 1,
                  color: AppColors.black.withOpacity(0.2),
                  endIndent: w * 0.02,
                  indent: w * 0.02,
                ),
                TextInputField(
                  controller: controller().messageController,
                  keyboardType: TextInputType.multiline,
                  enabled: true,
                  underline: false,
                  textCapitalization: TextCapitalization.sentences,
                  hintText: 'Type here',
                  textstyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.2),
                      fontWeight: FontWeight.w700,
                      fontSize: h * 0.019),
                  hintStyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.2),
                      fontWeight: FontWeight.w700,
                      fontSize: h * 0.019),
                  containerwidth: w,
                  containerheight: h * 0.06,
                  containercolor: AppColors.white,
                  bordercolor: null,
                  onTap: () {},
                  onChanged: (value) {
                    setState(() {});
                  },
                  // suffixicon: Material(
                  //   color: AppColors.transparent,
                  //   child: IconButton(
                  //     icon: Icon(
                  //       controller().messageController.text.isEmpty
                  //           ? Icons.mic
                  //           : Icons.send,
                  //       size: h * 0.03,
                  //       color: AppColors.black.withOpacity(0.4),
                  //     ),
                  //     onPressed: () {
                  //       if (controller().messageController.text.isEmpty) {
                  //         if (controller().speechRecognitionAvailable &&
                  //             !controller().isListening) {
                  //           print(
                  //               "ssdsdpeechRecognitionAvailable ${controller().speechRecognitionAvailable}");
                  //           print(
                  //               "isListeningisListening ${controller().isListening}");
                  //           controller().start();
                  //         }
                  //       }
                  //
                  //       // if (controller().textEditingController.text.isNotEmpty) {
                  //       //   setState(() {
                  //       //     sendmessageApi();
                  //       //
                  //       //     _message.add(Message(
                  //       //         customData: CustomData(),
                  //       //         userId: recid,
                  //       //         userType: recid,
                  //       //         type: "message",
                  //       //         message: _textEditingController.text));
                  //       //     SocketConfig().sendmsg(
                  //       //         text: _textEditingController.text,
                  //       //         recrole: recrole,
                  //       //         recid: recid,
                  //       //         msg: (msg) {
                  //       //           print("msgmsgmsg =-=-=- ${msg.userId}");
                  //       //           setState(() {
                  //       //             _message.add(msg);
                  //       //           });
                  //       //           if (_message.length > 4) {
                  //       //             print("innnsdfs");
                  //       //             WidgetsBinding.instance
                  //       //                 .addPostFrameCallback(
                  //       //                     (_) => _scrollToEnd());
                  //       //           }
                  //       //           print("_message_message $_message");
                  //       //         },
                  //       //         sendid: senderid,
                  //       //         sendtype: sendrole);
                  //       //
                  //       //     _textEditingController.clear();
                  //       //   });
                  //       // }
                  //       // if (chatList.length > 4) {
                  //       //   WidgetsBinding.instance
                  //       //       .addPostFrameCallback((_) => _scrollToEnd());
                  //       // }
                  //     },
                  //   ),
                  // ),
                  suffixicon: (controller().speechRecognitionAvailable ==
                              false ||
                          controller().isListening == false)
                      ? CommonIconButton(
                          containerwidth: h * 0.07,
                          containerheight: h * 0.07,
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          centericon: Icon(
                              controller().messageController.text.isEmpty
                                  ? Icons.mic
                                  : Icons.send,
                              color: AppColors.gray.withOpacity(0.6),
                              size: h * 0.03),
                          onPressed: () {
                            setState(() {
                              if (controller().messageController.text.isEmpty) {
                                if (controller().speechRecognitionAvailable &&
                                    !controller().isListening) {
                                  print(
                                      "ssdsdpeechRecognitionAvailable ${controller().speechRecognitionAvailable}");
                                  print(
                                      "isListeningisListening ${controller().isListening}");
                                  controller().start();
                                }
                              } else {
                                controller().onSend();
                              }
                            });
                          })
                      : GestureDetector(
                          onTap: () {
                            controller().stop();
                          },
                          child: CustomPaint(
                            painter: CirclePainter(
                              controller().animationController!,
                              color: AppColors.colorSecondary,
                            ),
                            child: SizedBox(
                              width: h * 0.07,
                              height: h * 0.07,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: ScaleTransition(
                                    scale: Tween(begin: 0.95, end: 1.0).animate(
                                      CurvedAnimation(
                                        parent:
                                            controller().animationController!,
                                        curve: CurveWave(),
                                      ),
                                    ),
                                    child: Icon(Icons.mic,
                                        color: AppColors.white.withOpacity(0.8),
                                        size: h * 0.03)),
                              ),
                            ),
                          ),
                        ),
                  prefix: Material(
                    color: AppColors.transparent,
                    child: IconButton(
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImg.paperclip,
                              height: h * 0.03, width: h * 0.03),
                        ],
                      ),
                      onPressed: () {},
                      // onPressed: toggleEmojiKeyboard,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _onBackspacePressed() {
    final asyncState = ref.watch(chatScreenControllerProvider);
    controller() => ref.read(chatScreenControllerProvider.notifier);

    controller().messageController
      ..text = controller().messageController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: controller().messageController.text.length));
  }
}
