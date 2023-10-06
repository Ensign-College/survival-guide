import 'package:flutter/material.dart';

enum ConnectionStateStatus {
  waiting,
  hasError,
  noData,
  hasData,
}

ConnectionStateStatus determineConnectionState(AsyncSnapshot snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return ConnectionStateStatus.waiting;
  } else if (snapshot.hasError) {
    return ConnectionStateStatus.hasError;
  } else if (!snapshot.hasData || (snapshot.data?.terms?.isEmpty ?? true)) {
    return ConnectionStateStatus.noData;
  } else {
    return ConnectionStateStatus.hasData;
  }
}