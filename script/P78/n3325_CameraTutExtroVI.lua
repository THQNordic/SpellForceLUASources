-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 231.904846 , 261.779175 , 21.058701 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3325);]] )
   Camera:MotionSpline_AddSplinePoint( 231.904846 , 261.779175 , 21.058701 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 231.904846 , 261.779175 , 21.058701 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 231.904846 , 261.779175 , 21.058701 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
