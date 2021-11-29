-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 45.682549 , 78.256569 , 16.380758 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5567);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 44.959007 , 81.993042 , 16.240765 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 44.221298 , 85.802658 , 15.950764 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 42.748108 , 93.410431 , 15.540817 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
