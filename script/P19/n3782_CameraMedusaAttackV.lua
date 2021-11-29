-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 337.967682 , 174.422424 , 75.225746 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(352.882,207.592,46.170);]] )
   Camera:MotionSpline_AddSplinePoint( 360.606781 , 168.350861 , 80.766739 , 8.099995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.980530 , 182.051682 , 64.725746 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 377.803436 , 208.396408 , 56.515747 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
