-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 619.410583 , 304.416992 , 46.067123 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11183);]] )
   Camera:MotionSpline_AddSplinePoint( 619.410583 , 304.416992 , 46.067123 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 619.410583 , 304.416992 , 46.067123 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 619.410583 , 304.416992 , 46.067123 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 14.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
