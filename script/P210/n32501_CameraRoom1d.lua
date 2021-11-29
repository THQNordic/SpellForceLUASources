-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 190.229187 , 474.734833 , 47.804489 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9561);Camera:ScriptSplineLookAtPosition(186.0,474.76,25.000);]] )
   Camera:MotionSpline_AddSplinePoint( 190.229187 , 474.734833 , 47.804489 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 190.229187 , 474.734833 , 47.804489 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 190.229187 , 474.734833 , 47.804489 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
