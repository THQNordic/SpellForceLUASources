-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 154.789917 , 153.120758 , 32.497723 , 8.999998 , [[Camera:ScriptSplineLookAtPosition(118.898,154.993,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 154.789917 , 153.120758 , 32.497723 , 5.899997 , [[Camera:ScriptSplineLookAtPosition(118.898,154.993,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 154.789917 , 153.120758 , 32.497723 , 8.899998 , [[Camera:ScriptSplineLookAtPosition(118.898,154.993,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 154.789917 , 153.120758 , 32.497723 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(118.898,154.993,18.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
