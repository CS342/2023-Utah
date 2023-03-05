//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
import FHIR
import Foundation
import Scheduler


/// A `Scheduler` using the `FHIR` standard as well as the ``UtahTaskContext`` to schedule and manage tasks and events in the
/// CardinalKit Utah Applciation.
public typealias UtahScheduler = Scheduler<FHIR, UtahTaskContext>
