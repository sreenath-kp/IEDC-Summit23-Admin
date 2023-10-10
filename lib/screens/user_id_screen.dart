import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/components/home_screen_texts.dart';
import 'package:summit_admin_app/components/progress_indicator.dart';
import 'package:summit_admin_app/components/text_spanner.dart';
import 'package:summit_admin_app/components/the_tick.dart';
import 'package:summit_admin_app/controller/attendee_controller.dart';
import 'package:summit_admin_app/models/attendee_model.dart';

class UserIDScreen extends ConsumerStatefulWidget {
  final String id;
  final Function() screenClosed;
  const UserIDScreen({
    Key? key,
    required this.id,
    required this.screenClosed,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserIDScreenState();
}

class _UserIDScreenState extends ConsumerState<UserIDScreen> {
  bool _isApproved = false;
  bool _marked = false;

  void _addAttendence(Attendee attendee) async {
    // TODO: check 
    await ref
        .watch(attendeeControllerProvider.notifier)
        .addAttendence(attendee);
    setState(
      () {
        _marked = true;
        _isApproved = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getAttendeeByIDProvider(widget.id)).when(
          data: (attendee) {
            return Scaffold(
              appBar: theAppBar(context),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      attendee.isPresent
                          ? "Attendance Marked"
                          : 'Scanning Successful!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: 125,
                      height: 125,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: attendee.isPresent
                            ? const TheTick()
                            : _isApproved
                                ? const TheTick()
                                : const Text("Not Approved"),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextSpanner(
                      title: "Name : ",
                      subtitile: attendee.name,
                    ),
                    TextSpanner(
                      title: "Ticket ID : ",
                      subtitile: attendee.iedcRegistrationNumber,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 287.10,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: _isApproved ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.70,
                            color: attendee.isPresent
                                ? Colors.grey
                                : _isApproved
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (attendee.isPresent) {
                            widget.screenClosed();
                            Navigator.of(context).pop();
                          }
                          if (!_isApproved) {
                            _addAttendence(attendee);
                          } else {
                            widget.screenClosed();
                            Navigator.of(context).pop();
                          }
                        },
                        child: Center(
                          child: Text(
                            attendee.isPresent
                                ? "Go to Scanner"
                                : _marked
                                    ? "Go to Scanner"
                                    : !_isApproved
                                        ? "Approve "
                                        : 'Go to Scanner',
                            style: TextStyle(
                              color: _isApproved ? Colors.black : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 287,
                      height: 60,
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 36,
                        right: 35,
                        bottom: 8,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          var nav = Navigator.of(context);
                          nav.pop();
                          nav.pop();
                        },
                        child: const Center(
                          child: Text(
                            'Go to Homepage',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HomeScreenText(text: "Invalid ID"),
                  const SizedBox(
                    height: 50,
                  ),
                  HomeButton(
                    title: "Retry",
                    func: () {
                      widget.screenClosed();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
          loading: () => const Loader(),
        );
  }

  AppBar theAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Add Attendence"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          widget.screenClosed();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
