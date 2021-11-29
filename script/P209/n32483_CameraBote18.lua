-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 294.444000 , 440.868378 , 14.108862 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(296.277,442.324,13.500);]] )
   Camera:MotionSpline_AddSplinePoint( 294.444000 , 440.868378 , 14.108862 , 6.299996 , [[Camera:ScriptSplineLookAtPosition(296.277,442.324,13.500);]] )
   Camera:MotionSpline_AddSplinePoint( 294.444000 , 440.868378 , 14.108862 , 9.500000 , [[Camera:ScriptSplineLookAtPosition(296.277,442.324,13.500);]] )
   Camera:MotionSpline_AddSplinePoint( 294.444000 , 440.868378 , 14.108862 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(296.277,442.324,13.500);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
