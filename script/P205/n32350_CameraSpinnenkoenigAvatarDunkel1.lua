-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 212.102020 , 414.008087 , 20.515131 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(161.503,434.395,21.494);]] )
   Camera:MotionSpline_AddSplinePoint( 188.000153 , 418.924835 , 22.855125 , 4.699998 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 183.013306 , 420.105652 , 22.855131 , 5.299997 , [[Camera:ScriptSplineLookAtNpc(9251);
Camera:ScriptSplineLookAtApproachingModifier(0.05);
]] )
   Camera:MotionSpline_AddSplinePoint( 180.860397 , 420.359924 , 22.855131 , 5.999997 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 177.884109 , 421.487457 , 22.855131 , 6.599996 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 176.029236 , 424.605774 , 22.126112 , 7.299995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 174.707062 , 428.317749 , 22.114193 , 8.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 171.669296 , 435.664948 , 22.874186 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 173.760971 , 440.085419 , 24.934151 , 9.800001 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
